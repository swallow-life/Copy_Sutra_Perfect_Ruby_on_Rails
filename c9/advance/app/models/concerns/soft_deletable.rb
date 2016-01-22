#9.29
module SoftDeletable
	extend ActiveSupport::Concern

	included do
		attr_reader :paranoia_column
		@@paranoia_column = :deleted_at # default paranoia_column

		def self.set_paranoia_column(column_name)
			@@paranoia_column = column_name.to_sym
		end

		scope :not_deleted, -> { where(paranoia_column, nil) }

		alias_method :__orig_destroy, :destroy
		alias_method :__orig_destroyed?, :destroyed?

		# alias_methodの後に定義しなければならない
		#
		# @example
		#  recore.destroy(soft: true) #=> Soft Delete
		#  recore.destroy             #=> Normal Delete
		def destroy(soft: false)
			return __orig_destroy unless soft

			unless destroyed?
				update(paranoia_column => Time.current)
			end
		end

		# alias_methodの後に定義しなければならない
		#
		# @example
		#  recore.destroyed?(soft: true)
		#  recore.destroyed?
		def destroyed?(soft: false)
			return __orig_destroyed? unless soft

			!send(paranoia_column).nil?
		end

		def restore
			update(paranoia_column => nil) if destroyed?
		end
	end

	module ClassMethods
		def validates_uniqueness_without_deleted(*attr_names)
			validates_with UniquenessWithoutDeletedValidator, _merge_attributes(attr_names)
		end
	end

	class UniquenessWithoutDeletedValidator < ActiveRecord::Validations::UniquenessValidator
		def validate_each(record, attribute, value)
			finder_class = find_finder_class_for(record)
			table = finder_class.arel_table
			value = deserialize_attribute(record, attribute, value)

			relation = build_relation(finder_class, tabel, attribute, value)
			relation = relation.and(table[finder_class.primary_key.to_sym].not_eq(record.id)) if record.persisted?
			relation = scope_relation(record, table, relation)
			relation = finder_class.unscoped.where(relation)
			relation = relation.merge(options[:conditions]) if options[:conditions]

			paranoia_column = record.paranoia_column
			relation = relation.merge(-> { where(paranoia_column => nil) })

			if relation.exists?
				error_options = options.except(:case_sensitive, :scope, :conditions)
				error_options[:value] = value

				record.errors.add(attribute, :taken, error_options)
			end
		end
	end
end
