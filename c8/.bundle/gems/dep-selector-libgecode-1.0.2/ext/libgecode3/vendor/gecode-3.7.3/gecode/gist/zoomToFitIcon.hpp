/* -*- mode: C++; c-basic-offset: 2; indent-tabs-mode: nil -*- */
/*
 *  Main authors:
 *     Guido Tack <tack@gecode.org>
 *
 *  Copyright:
 *     Guido Tack, 2006
 *
 *  Last modified:
 *     $Date: 2009-01-21 21:36:29 +1100 (Wed, 21 Jan 2009) $ by $Author: schulte $
 *     $Revision: 8083 $
 *
 *  This file is part of Gecode, the generic constraint
 *  development environment:
 *     http://www.gecode.org
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

namespace Gecode { namespace Gist {

  const unsigned char zoomToFitIcon[] = {
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x15, 0x08, 0x06, 0x00, 0x00, 0x00, 0xAD, 0xE2, 0x75,
0xAB, 0x00, 0x00, 0x01, 0xCB, 0x69, 0x43, 0x43, 0x50, 0x49, 0x43, 0x43, 0x20, 0x50, 0x72, 0x6F,
0x66, 0x69, 0x6C, 0x65, 0x00, 0x00, 0x78, 0x9C, 0x8D, 0x91, 0x4D, 0x6B, 0x13, 0x51, 0x18, 0x85,
0x9F, 0x3B, 0x41, 0x5A, 0x50, 0x82, 0xE0, 0x54, 0x24, 0xAB, 0x59, 0x48, 0xAC, 0x10, 0x65, 0x9A,
0x04, 0x9A, 0x8D, 0x30, 0x6D, 0x92, 0x5A, 0x61, 0x84, 0x21, 0x8D, 0xE6, 0x63, 0x97, 0xCE, 0x8C,
0x49, 0x21, 0x33, 0xBD, 0x4E, 0xA6, 0x1F, 0x82, 0x8B, 0xFA, 0x27, 0x74, 0x21, 0x82, 0x2B, 0x49,
0x41, 0x14, 0x57, 0x15, 0x74, 0x51, 0x70, 0xE3, 0xC6, 0x85, 0x08, 0x1A, 0xFC, 0x0B, 0xBA, 0x2B,
0x74, 0x23, 0x65, 0x5C, 0x5C, 0x43, 0x16, 0x1A, 0xEC, 0x81, 0x0B, 0xCF, 0x7B, 0xB8, 0xF0, 0xDE,
0x7B, 0x0E, 0xA4, 0x4A, 0x1D, 0x29, 0xFB, 0x1A, 0x10, 0x84, 0x71, 0x54, 0xBB, 0xB9, 0x6C, 0x34,
0x5B, 0x6D, 0x63, 0x66, 0x84, 0x46, 0x86, 0x34, 0x59, 0x2E, 0x75, 0xDC, 0x81, 0x5C, 0x72, 0x1C,
0x9B, 0xA9, 0x3A, 0xFE, 0x8A, 0x00, 0xF8, 0x72, 0xAD, 0x23, 0x65, 0x7F, 0xFA, 0xBD, 0x7F, 0x2A,
0x1D, 0x35, 0x5B, 0x6D, 0x10, 0x39, 0x40, 0xEF, 0x2A, 0xB6, 0x00, 0x7D, 0x5D, 0x71, 0x1D, 0xD0,
0x77, 0x62, 0x19, 0x83, 0xE8, 0x01, 0xBA, 0xDB, 0xEB, 0x78, 0x20, 0x1E, 0x02, 0xB9, 0xA8, 0x5E,
0x2B, 0x83, 0x18, 0x02, 0xE9, 0xAE, 0xE2, 0xB7, 0x40, 0x7A, 0x5D, 0xF1, 0x47, 0x20, 0xBD, 0xED,
0x76, 0x63, 0x10, 0x23, 0xC0, 0x0C, 0xBD, 0x8D, 0x10, 0xB4, 0x59, 0xA0, 0xE4, 0xF9, 0x03, 0x17,
0x34, 0x0B, 0xE8, 0x79, 0x03, 0x37, 0x00, 0x6D, 0x08, 0x2C, 0x07, 0xC1, 0xA6, 0x07, 0xDA, 0x4F,
0x60, 0xDE, 0x95, 0x51, 0x0C, 0x29, 0x1D, 0xB8, 0xDC, 0x6C, 0xB5, 0x0D, 0xF5, 0xE4, 0xA7, 0x3F,
0xE0, 0x76, 0x06, 0x44, 0x71, 0xE2, 0x15, 0x5E, 0xC3, 0xB3, 0x1A, 0xCC, 0xDD, 0x9F, 0x78, 0x57,
0x6E, 0xC0, 0xDC, 0x3E, 0xBC, 0x7F, 0x34, 0xF1, 0x8E, 0x46, 0x08, 0x40, 0x5C, 0x9C, 0x1D, 0xDC,
0x2B, 0xE4, 0x01, 0x10, 0x67, 0x0F, 0xE0, 0xCC, 0xE3, 0x24, 0x39, 0x6A, 0xC0, 0xCC, 0x55, 0x38,
0xF9, 0x96, 0x24, 0xBF, 0x0E, 0x92, 0xE4, 0xE4, 0x05, 0xA4, 0xBE, 0xC3, 0xE1, 0xB1, 0xBB, 0x15,
0x6D, 0xFF, 0xC9, 0x4B, 0x88, 0x4F, 0xF0, 0xBF, 0x59, 0xFD, 0x59, 0xCD, 0xF0, 0x39, 0x1E, 0xD3,
0x34, 0x56, 0xB9, 0x00, 0x60, 0xC2, 0xFE, 0x1E, 0xD4, 0x2D, 0x28, 0xEE, 0xC1, 0xAB, 0x43, 0xC8,
0x3E, 0x81, 0x0B, 0xEF, 0xC0, 0xB1, 0xA0, 0x6E, 0xA1, 0x15, 0x0A, 0xE3, 0xA3, 0x32, 0x54, 0x3D,
0x56, 0xAA, 0xB6, 0x9D, 0x2F, 0x9A, 0x8B, 0x8D, 0x15, 0x67, 0xB5, 0x7C, 0xDA, 0xF6, 0x4F, 0xA9,
0xA0, 0xBF, 0x35, 0xDE, 0xA3, 0x01, 0xE7, 0xFC, 0xF0, 0xCE, 0x1A, 0x90, 0x01, 0xE6, 0x3D, 0xBF,
0x52, 0x1D, 0x33, 0x15, 0xAA, 0xD8, 0xD8, 0xE4, 0x29, 0x62, 0xB2, 0x48, 0x83, 0x15, 0x1C, 0x56,
0x29, 0x83, 0xEA, 0x15, 0xE0, 0xFC, 0x4B, 0x78, 0x9E, 0x5D, 0xB8, 0xBB, 0xB0, 0xF6, 0xE1, 0xCD,
0xF0, 0xAF, 0x5D, 0xB1, 0xBF, 0x1B, 0x03, 0x94, 0x37, 0xE5, 0x83, 0x68, 0xA3, 0xDB, 0x8B, 0x8D,
0x25, 0x29, 0xFB, 0x7E, 0xCE, 0xB8, 0x15, 0xBA, 0xD7, 0x73, 0x46, 0xDE, 0x34, 0x4B, 0xFC, 0x06,
0xAB, 0xAD, 0x81, 0x02, 0xA4, 0x57, 0xD6, 0x2F, 0x00, 0x00, 0x00, 0x09, 0x70, 0x48, 0x59, 0x73,
0x00, 0x00, 0x0B, 0x13, 0x00, 0x00, 0x0B, 0x13, 0x01, 0x00, 0x9A, 0x9C, 0x18, 0x00, 0x00, 0x02,
0x34, 0x49, 0x44, 0x41, 0x54, 0x38, 0x8D, 0xAD, 0x95, 0xBF, 0x6B, 0x13, 0x61, 0x18, 0xC7, 0x3F,
0x97, 0x1F, 0xD7, 0x6B, 0xD3, 0x4B, 0xC8, 0x2D, 0x0D, 0x11, 0xDC, 0x82, 0x52, 0x11, 0x4C, 0x20,
0x50, 0xC4, 0x21, 0x93, 0x88, 0x45, 0x02, 0xD2, 0xA5, 0x9B, 0xFD, 0x03, 0xEA, 0x92, 0x4D, 0x91,
0x84, 0x4E, 0x11, 0x1C, 0xDC, 0x45, 0x24, 0x08, 0x07, 0x86, 0x2E, 0x1D, 0x0A, 0x05, 0x21, 0xB9,
0xCB, 0x16, 0x43, 0xC0, 0x12, 0xA4, 0x01, 0xC5, 0xA1, 0x83, 0x15, 0xEC, 0x50, 0xDA, 0x98, 0x5E,
0x93, 0xAB, 0xAF, 0x43, 0x72, 0x18, 0x9A, 0xB4, 0xBD, 0xD4, 0x7C, 0xE1, 0xE0, 0xDE, 0x87, 0x87,
0xEF, 0xE7, 0x79, 0xDE, 0xE7, 0x78, 0xCE, 0xCB, 0xB0, 0xA6, 0x80, 0x9B, 0xC0, 0x03, 0xE0, 0x51,
0xFF, 0xFC, 0x07, 0x38, 0x18, 0x91, 0x7B, 0xA1, 0xA4, 0x33, 0xE7, 0x85, 0x40, 0x20, 0xB0, 0x1E,
0x0A, 0x85, 0x82, 0xC9, 0x64, 0x92, 0x58, 0x2C, 0xE6, 0x2F, 0x95, 0x4A, 0x56, 0xB3, 0xD9, 0x94,
0x81, 0xB7, 0xED, 0x76, 0x3B, 0x03, 0x74, 0xC7, 0x85, 0x30, 0x3B, 0x3B, 0xFB, 0x7C, 0x7A, 0x7A,
0xDA, 0xDA, 0xDC, 0xDC, 0x14, 0x67, 0x65, 0x59, 0x96, 0x48, 0xA7, 0xD3, 0xBF, 0x23, 0x91, 0x48,
0x0D, 0xF0, 0x8D, 0xEB, 0xBD, 0x00, 0x88, 0xBD, 0xBD, 0xBD, 0x21, 0xE3, 0x41, 0x2D, 0x2E, 0x2E,
0xDA, 0xAA, 0xAA, 0x9A, 0x6E, 0x4D, 0x7D, 0xC0, 0x54, 0x20, 0x10, 0x58, 0x2F, 0x16, 0x8B, 0x44,
0x22, 0x11, 0xD6, 0xD6, 0xD6, 0x10, 0x42, 0x00, 0x90, 0xCD, 0x66, 0x31, 0x4D, 0x13, 0xC3, 0x30,
0x90, 0x24, 0x89, 0x8D, 0x8D, 0x0D, 0x6F, 0x3C, 0x1E, 0x8F, 0x37, 0x1A, 0x8D, 0x15, 0xE0, 0x9D,
0x1B, 0xC0, 0xAD, 0x68, 0x34, 0x7A, 0xE8, 0x54, 0x97, 0xCB, 0xE5, 0x46, 0x56, 0xED, 0xC4, 0x75,
0x5D, 0x17, 0x9A, 0xA6, 0x6D, 0xB9, 0x31, 0xF6, 0x00, 0x89, 0x64, 0x32, 0xE9, 0xB6, 0x53, 0x12,
0x89, 0x04, 0xDD, 0x6E, 0x37, 0xEE, 0x36, 0xFF, 0x59, 0x26, 0x93, 0xB1, 0x2E, 0xBC, 0xEC, 0x01,
0xB5, 0x5A, 0x2D, 0xE1, 0xF3, 0xF9, 0x2C, 0xC0, 0xEB, 0xA6, 0xF2, 0x4F, 0xE5, 0x72, 0xF9, 0xD8,
0x09, 0x98, 0xE6, 0xE8, 0x79, 0x39, 0xF1, 0x5A, 0xAD, 0x46, 0x30, 0x18, 0xFC, 0x0A, 0x9C, 0xBA,
0x31, 0xFF, 0xD6, 0x6C, 0x36, 0xE5, 0x93, 0x93, 0x13, 0x00, 0x0C, 0xC3, 0x18, 0x99, 0xE8, 0xC4,
0xAB, 0xD5, 0x6A, 0xB7, 0xDD, 0x6E, 0x7F, 0xBE, 0xCC, 0x18, 0x7A, 0xAD, 0x1D, 0xC8, 0xB2, 0x3C,
0x57, 0xAF, 0xD7, 0x6F, 0x2F, 0x2F, 0x2F, 0xFB, 0x2B, 0x95, 0x0A, 0x86, 0x61, 0x60, 0x9A, 0x26,
0xA9, 0x54, 0x0A, 0xD3, 0x34, 0x29, 0x14, 0x0A, 0x48, 0x92, 0x44, 0x38, 0x1C, 0x66, 0x69, 0x69,
0xC9, 0x6B, 0xDB, 0xF6, 0x43, 0xE0, 0xC8, 0x0D, 0x00, 0x40, 0x51, 0x14, 0xE5, 0xD7, 0xEA, 0xEA,
0x6A, 0xD7, 0xB6, 0xED, 0x91, 0x77, 0xBD, 0xBD, 0xBD, 0x2D, 0x66, 0x66, 0x66, 0x3A, 0x92, 0x24,
0xED, 0x03, 0x1F, 0x81, 0x39, 0xB7, 0xE6, 0x00, 0xAA, 0x2C, 0xCB, 0xBB, 0xF3, 0xF3, 0xF3, 0x87,
0xBA, 0xAE, 0x8B, 0x9D, 0x9D, 0x1D, 0xD1, 0x6A, 0xB5, 0x44, 0xB9, 0x5C, 0x16, 0xF9, 0x7C, 0xBE,
0xA3, 0x28, 0xCA, 0x91, 0xC7, 0xE3, 0x79, 0x0D, 0x88, 0xFE, 0xF3, 0x1D, 0xB8, 0x31, 0x0E, 0x00,
0x60, 0x45, 0xD3, 0xB4, 0x2D, 0x55, 0x55, 0x7F, 0xFA, 0xFD, 0x7E, 0x4B, 0xD3, 0xB4, 0x86, 0xA2,
0x28, 0xEF, 0x81, 0x6B, 0xF4, 0x66, 0xF4, 0x66, 0x00, 0xB0, 0x0F, 0xDC, 0x1D, 0x17, 0xE0, 0xE8,
0xBC, 0xCF, 0xED, 0xC5, 0x00, 0xE0, 0x18, 0x78, 0x7C, 0x55, 0xC0, 0x79, 0x7A, 0x02, 0x74, 0xFA,
0x80, 0x53, 0xE0, 0xE9, 0xA4, 0x01, 0xF7, 0x81, 0x43, 0xFE, 0x75, 0xF1, 0x8A, 0xE1, 0x35, 0xFE,
0x5F, 0xBA, 0x03, 0xFC, 0x18, 0x00, 0x7C, 0xA0, 0xF7, 0x83, 0x99, 0x98, 0xAE, 0x03, 0x5F, 0x06,
0x00, 0x2F, 0xA1, 0x37, 0xFD, 0x49, 0x68, 0x17, 0xB8, 0x07, 0x38, 0xBB, 0xE3, 0xD2, 0xD5, 0x70,
0x55, 0xC5, 0x9C, 0x97, 0xBF, 0x3E, 0xCA, 0x4D, 0x0B, 0x4A, 0x32, 0x37, 0x13, 0x00, 0x00, 0x00,
0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82
  };
}}

// STATISTICS: gist-any
