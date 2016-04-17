/*
 *       _,.--.,_                             _,.--.,_
 *      |  _____ |                           | _____  |
 *      |-'     `'._________________________,'`     `-|
 *    ,'    ___    `.                     ,'     .-.   ``.
 *   /     |   |     \                   /      (/_\)     \
 *  !  ___  \ /  ___  |                 !   ,-.  `-'  ,-.  |
 *  | |___>     <___| !_SELECT   START__|  ([ ])     ( O ) !
 *  !       / \      ____`-.       .-'____  `-'  .-.  `-'  |
 *  |\     |___|   ,'    `. \     / ,'    `.    ( X )     /|
 *  | `~          /        \ |   | /        \    `-'    ,' |
 *  |   `-~___,-. \        / |___| \        / ,-.____,-'   |
 *  |           '\ `.____,' /     \ `.____,' /`.           |
 *  |          /  `-.____,-'       `-.____,-'   \          |
 *  \         /                                  \         /
 *   \       /                                    \       /
 *    `.__,-'                                      `-.__,'
 *
 *
 *                                GHL <2012.2.9.ghl@gmail.com>
 */

#ifndef RIN_H_INCLUDED_BNX6SFLD
#define RIN_H_INCLUDED_BNX6SFLD

// {{{ PPPP
#define RIN_VAL_0         0
#define RIN_VAL_MINUS_0  -1
#define RIN_VAL_PLUS_0    1
#define RIN_VAL_HALF_0    0
#define RIN_VAL_DOUBLE_0  0
#define RIN_VAL_1         1
#define RIN_VAL_MINUS_1   0
#define RIN_VAL_PLUS_1    2
#define RIN_VAL_HALF_1    0
#define RIN_VAL_DOUBLE_1  2
#define RIN_VAL_2         2
#define RIN_VAL_MINUS_2   1
#define RIN_VAL_PLUS_2    3
#define RIN_VAL_HALF_2    1
#define RIN_VAL_DOUBLE_2  4
#define RIN_VAL_3         3
#define RIN_VAL_MINUS_3   2
#define RIN_VAL_PLUS_3    4
#define RIN_VAL_HALF_3    1
#define RIN_VAL_DOUBLE_3  6
#define RIN_VAL_4         4
#define RIN_VAL_MINUS_4   3
#define RIN_VAL_PLUS_4    5
#define RIN_VAL_HALF_4    2
#define RIN_VAL_DOUBLE_4  8
#define RIN_VAL_5         5
#define RIN_VAL_MINUS_5   4
#define RIN_VAL_PLUS_5    6
#define RIN_VAL_HALF_5    2
#define RIN_VAL_DOUBLE_5  10
#define RIN_VAL_6         6
#define RIN_VAL_MINUS_6   5
#define RIN_VAL_PLUS_6    7
#define RIN_VAL_HALF_6    3
#define RIN_VAL_DOUBLE_6  12
#define RIN_VAL_7         7
#define RIN_VAL_MINUS_7   6
#define RIN_VAL_PLUS_7    8
#define RIN_VAL_HALF_7    3
#define RIN_VAL_DOUBLE_7  14
#define RIN_VAL_8         8
#define RIN_VAL_MINUS_8   7
#define RIN_VAL_PLUS_8    9
#define RIN_VAL_HALF_8    4
#define RIN_VAL_DOUBLE_8  16
#define RIN_VAL_9         9
#define RIN_VAL_MINUS_9   8
#define RIN_VAL_PLUS_9    10
#define RIN_VAL_HALF_9    4
#define RIN_VAL_DOUBLE_9  18
#define RIN_VAL_10        10
#define RIN_VAL_MINUS_10  9
#define RIN_VAL_PLUS_10   11
#define RIN_VAL_HALF_10   5
#define RIN_VAL_DOUBLE_10 20
#define RIN_VAL_11        11
#define RIN_VAL_MINUS_11  10
#define RIN_VAL_PLUS_11   12
#define RIN_VAL_HALF_11   5
#define RIN_VAL_DOUBLE_11 22
#define RIN_VAL_12        12
#define RIN_VAL_MINUS_12  11
#define RIN_VAL_PLUS_12   13
#define RIN_VAL_HALF_12   6
#define RIN_VAL_DOUBLE_12 24
#define RIN_VAL_13        13
#define RIN_VAL_MINUS_13  12
#define RIN_VAL_PLUS_13   14
#define RIN_VAL_HALF_13   6
#define RIN_VAL_DOUBLE_13 26
#define RIN_VAL_14        14
#define RIN_VAL_MINUS_14  13
#define RIN_VAL_PLUS_14   15
#define RIN_VAL_HALF_14   7
#define RIN_VAL_DOUBLE_14 28
#define RIN_VAL_15        15
#define RIN_VAL_MINUS_15  14
#define RIN_VAL_PLUS_15   16
#define RIN_VAL_HALF_15   7
#define RIN_VAL_DOUBLE_15 30
#define RIN_VAL_16        16
#define RIN_VAL_MINUS_16  15
#define RIN_VAL_PLUS_16   17
#define RIN_VAL_HALF_16   8
#define RIN_VAL_DOUBLE_16 32
#define RIN_VAL_17        17
#define RIN_VAL_MINUS_17  16
#define RIN_VAL_PLUS_17   18
#define RIN_VAL_HALF_17   8
#define RIN_VAL_DOUBLE_17 34
#define RIN_VAL_18        18
#define RIN_VAL_MINUS_18  17
#define RIN_VAL_PLUS_18   19
#define RIN_VAL_HALF_18   9
#define RIN_VAL_DOUBLE_18 36
#define RIN_VAL_19        19
#define RIN_VAL_MINUS_19  18
#define RIN_VAL_PLUS_19   20
#define RIN_VAL_HALF_19   9
#define RIN_VAL_DOUBLE_19 38
#define RIN_VAL_20        20
#define RIN_VAL_MINUS_20  19
#define RIN_VAL_PLUS_20   21
#define RIN_VAL_HALF_20   10
#define RIN_VAL_DOUBLE_20 40
#define RIN_VAL_21        21
#define RIN_VAL_MINUS_21  20
#define RIN_VAL_PLUS_21   22
#define RIN_VAL_HALF_21   10
#define RIN_VAL_DOUBLE_21 42
#define RIN_VAL_22        22
#define RIN_VAL_MINUS_22  21
#define RIN_VAL_PLUS_22   23
#define RIN_VAL_HALF_22   11
#define RIN_VAL_DOUBLE_22 44
#define RIN_VAL_23        23
#define RIN_VAL_MINUS_23  22
#define RIN_VAL_PLUS_23   24
#define RIN_VAL_HALF_23   11
#define RIN_VAL_DOUBLE_23 46
#define RIN_VAL_24        24
#define RIN_VAL_MINUS_24  23
#define RIN_VAL_PLUS_24   25
#define RIN_VAL_HALF_24   12
#define RIN_VAL_DOUBLE_24 48
#define RIN_VAL_25        25
#define RIN_VAL_MINUS_25  24
#define RIN_VAL_PLUS_25   26
#define RIN_VAL_HALF_25   12
#define RIN_VAL_DOUBLE_25 50
#define RIN_VAL_26        26
#define RIN_VAL_MINUS_26  25
#define RIN_VAL_PLUS_26   27
#define RIN_VAL_HALF_26   13
#define RIN_VAL_DOUBLE_26 52
#define RIN_VAL_27        27
#define RIN_VAL_MINUS_27  26
#define RIN_VAL_PLUS_27   28
#define RIN_VAL_HALF_27   13
#define RIN_VAL_DOUBLE_27 54
#define RIN_VAL_28        28
#define RIN_VAL_MINUS_28  27
#define RIN_VAL_PLUS_28   29
#define RIN_VAL_HALF_28   14
#define RIN_VAL_DOUBLE_28 56
#define RIN_VAL_29        29
#define RIN_VAL_MINUS_29  28
#define RIN_VAL_PLUS_29   30
#define RIN_VAL_HALF_29   14
#define RIN_VAL_DOUBLE_29 58
#define RIN_VAL_30        30
#define RIN_VAL_MINUS_30  29
#define RIN_VAL_PLUS_30   31
#define RIN_VAL_HALF_30   15
#define RIN_VAL_DOUBLE_30 60
#define RIN_VAL_31        31
#define RIN_VAL_MINUS_31  30
#define RIN_VAL_PLUS_31   32
#define RIN_VAL_HALF_31   15
#define RIN_VAL_DOUBLE_31 62

#define RIN_PLUS(N)   RIN_CAT(RIN_VAL_PLUS_, N)
#define RIN_MINUS(N)  RIN_CAT(RIN_VAL_MINUS_, N)
#define RIN_HALF(N)   RIN_CAT(RIN_VAL_HALF_, N)
#define RIN_DOUBLE(N) RIN_CAT(RIN_VAL_DOUBLE_, N)

#define RIN_NARGS_DUMMY_ARGS 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, \
                              20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, \
                               9,  8,  7,  6,  5,  4,  3,  2,  1,  0

#define RIN_NARGS_HELPER(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, \
                          _11, _12, _13, _14, _15, _16, _17, _18, _19, \
                          _20, _21, _22, _23, _24, _25, _26, _27, _28, \
                          _29, _30, _31, Q, ...) Q

#define RIN_NARGS_DO_CNT(args...) RIN_NARGS_HELPER(args)
#define RIN_VA_ARGC(args...)  RIN_NARGS_DO_CNT(_, ##args, RIN_NARGS_DUMMY_ARGS)

#define RIN_KITTY(a, b)           a ## b
#define RIN_CAT(a, b)             RIN_KITTY(a, b)
#define RIN_QUOTE(x)              #x
#define RIN_STRINGIFY(x)          RIN_QUOTE(x)

#define RIN_JOIN_2(a, b)          RIN_CAT(a, b)
#define RIN_JOIN_3(car, cdr...)   RIN_CAT(car, RIN_JOIN_2(cdr))
#define RIN_JOIN_4(car, cdr...)   RIN_CAT(car, RIN_JOIN_3(cdr))
#define RIN_JOIN_5(car, cdr...)   RIN_CAT(car, RIN_JOIN_4(cdr))
#define RIN_JOIN_6(car, cdr...)   RIN_CAT(car, RIN_JOIN_5(cdr))
#define RIN_JOIN_7(car, cdr...)   RIN_CAT(car, RIN_JOIN_6(cdr))
#define RIN_JOIN_8(car, cdr...)   RIN_CAT(car, RIN_JOIN_7(cdr))
#define RIN_JOIN_9(car, cdr...)   RIN_CAT(car, RIN_JOIN_8(cdr))
#define RIN_JOIN_10(car, cdr...)  RIN_CAT(car, RIN_JOIN_9(cdr))
#define RIN_JOIN_11(car, cdr...)  RIN_CAT(car, RIN_JOIN_10(cdr))
#define RIN_JOIN_12(car, cdr...)  RIN_CAT(car, RIN_JOIN_11(cdr))
#define RIN_JOIN_13(car, cdr...)  RIN_CAT(car, RIN_JOIN_12(cdr))
#define RIN_JOIN_14(car, cdr...)  RIN_CAT(car, RIN_JOIN_13(cdr))
#define RIN_JOIN_15(car, cdr...)  RIN_CAT(car, RIN_JOIN_14(cdr))
#define RIN_JOIN_16(car, cdr...)  RIN_CAT(car, RIN_JOIN_15(cdr))
#define RIN_JOIN_17(car, cdr...)  RIN_CAT(car, RIN_JOIN_16(cdr))
#define RIN_JOIN_18(car, cdr...)  RIN_CAT(car, RIN_JOIN_17(cdr))
#define RIN_JOIN_19(car, cdr...)  RIN_CAT(car, RIN_JOIN_18(cdr))
#define RIN_JOIN_20(car, cdr...)  RIN_CAT(car, RIN_JOIN_19(cdr))
#define RIN_JOIN_21(car, cdr...)  RIN_CAT(car, RIN_JOIN_20(cdr))
#define RIN_JOIN_22(car, cdr...)  RIN_CAT(car, RIN_JOIN_21(cdr))
#define RIN_JOIN_23(car, cdr...)  RIN_CAT(car, RIN_JOIN_22(cdr))
#define RIN_JOIN_24(car, cdr...)  RIN_CAT(car, RIN_JOIN_23(cdr))
#define RIN_JOIN_25(car, cdr...)  RIN_CAT(car, RIN_JOIN_24(cdr))
#define RIN_JOIN_26(car, cdr...)  RIN_CAT(car, RIN_JOIN_25(cdr))
#define RIN_JOIN_27(car, cdr...)  RIN_CAT(car, RIN_JOIN_26(cdr))
#define RIN_JOIN_28(car, cdr...)  RIN_CAT(car, RIN_JOIN_27(cdr))
#define RIN_JOIN_29(car, cdr...)  RIN_CAT(car, RIN_JOIN_28(cdr))
#define RIN_JOIN_30(car, cdr...)  RIN_CAT(car, RIN_JOIN_29(cdr))
#define RIN_JOIN_31(car, cdr...)  RIN_CAT(car, RIN_JOIN_30(cdr))
#define RIN_JOIN(args...)         RIN_CAT(RIN_JOIN_, RIN_VA_ARGC(args))(args)

#define RIN_APPLY_0(M, F, args...)   F, ##args
#define RIN_APPLY_1(M, F, args...)   M(F, ##args)
#define RIN_APPLY_2(M, F, args...)   M(RIN_APPLY_1(M, F, ##args), ##args)
#define RIN_APPLY_3(M, F, args...)   M(RIN_APPLY_2(M, F, ##args), ##args)
#define RIN_APPLY_4(M, F, args...)   M(RIN_APPLY_3(M, F, ##args), ##args)
#define RIN_APPLY_5(M, F, args...)   M(RIN_APPLY_4(M, F, ##args), ##args)
#define RIN_APPLY_6(M, F, args...)   M(RIN_APPLY_5(M, F, ##args), ##args)
#define RIN_APPLY_7(M, F, args...)   M(RIN_APPLY_6(M, F, ##args), ##args)
#define RIN_APPLY_8(M, F, args...)   M(RIN_APPLY_7(M, F, ##args), ##args)
#define RIN_APPLY_9(M, F, args...)   M(RIN_APPLY_8(M, F, ##args), ##args)
#define RIN_APPLY_10(M, F, args...)  M(RIN_APPLY_9(M, F, ##args), ##args)
#define RIN_APPLY_11(M, F, args...)  M(RIN_APPLY_10(M, F, ##args), ##args)
#define RIN_APPLY_12(M, F, args...)  M(RIN_APPLY_11(M, F, ##args), ##args)
#define RIN_APPLY_13(M, F, args...)  M(RIN_APPLY_12(M, F, ##args), ##args)
#define RIN_APPLY_14(M, F, args...)  M(RIN_APPLY_13(M, F, ##args), ##args)
#define RIN_APPLY_15(M, F, args...)  M(RIN_APPLY_14(M, F, ##args), ##args)
#define RIN_APPLY_16(M, F, args...)  M(RIN_APPLY_15(M, F, ##args), ##args)
#define RIN_APPLY_17(M, F, args...)  M(RIN_APPLY_16(M, F, ##args), ##args)
#define RIN_APPLY_18(M, F, args...)  M(RIN_APPLY_17(M, F, ##args), ##args)
#define RIN_APPLY_19(M, F, args...)  M(RIN_APPLY_18(M, F, ##args), ##args)
#define RIN_APPLY_20(M, F, args...)  M(RIN_APPLY_19(M, F, ##args), ##args)
#define RIN_APPLY_21(M, F, args...)  M(RIN_APPLY_20(M, F, ##args), ##args)
#define RIN_APPLY_22(M, F, args...)  M(RIN_APPLY_21(M, F, ##args), ##args)
#define RIN_APPLY_23(M, F, args...)  M(RIN_APPLY_22(M, F, ##args), ##args)
#define RIN_APPLY_24(M, F, args...)  M(RIN_APPLY_23(M, F, ##args), ##args)
#define RIN_APPLY_25(M, F, args...)  M(RIN_APPLY_24(M, F, ##args), ##args)
#define RIN_APPLY_26(M, F, args...)  M(RIN_APPLY_25(M, F, ##args), ##args)
#define RIN_APPLY_27(M, F, args...)  M(RIN_APPLY_26(M, F, ##args), ##args)
#define RIN_APPLY_28(M, F, args...)  M(RIN_APPLY_27(M, F, ##args), ##args)
#define RIN_APPLY_29(M, F, args...)  M(RIN_APPLY_28(M, F, ##args), ##args)
#define RIN_APPLY_30(M, F, args...)  M(RIN_APPLY_29(M, F, ##args), ##args)
#define RIN_APPLY_31(M, F, args...)  M(RIN_APPLY_30(M, F, ##args), ##args)
#define RIN_APPLY_N(N, M, F, args...)  RIN_CAT(RIN_APPLY_, N)(M, F, ##args)
#define RIN_APPLY(M, F, args...)     RIN_CAT(RIN_APPLY_, RIN_VA_ARGC(args))(M, F, ##args)

#define RIN_DO_1(M, COMMA, a)             M(a)
#define RIN_DO_2(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_3(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_4(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_5(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_6(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_7(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_8(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_9(M, COMMA, a, args...)    M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_10(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_11(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_12(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_13(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_14(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_15(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_16(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_17(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_18(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_19(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_20(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_21(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_22(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_23(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_24(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_25(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_26(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_27(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_28(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_29(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_30(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_31(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)
#define RIN_DO_32(M, COMMA, a, args...)   M(a) COMMA RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)

#define RIN_DO(M, COMMA, args...)     RIN_CAT(RIN_DO_, RIN_VA_ARGC(args))(M, COMMA, ##args)


#define RIN_PLUS_N(N, PLS)            RIN_APPLY(PLS, RIN_PLUS, N)
#define RIN_MINUS_N(N, MNS)           RIN_APPLY(MNS, RIN_MINUS, N)
#define RIN_COMMA()                  ,

// }}}

// {{{ stdincl
#include <cstddef>
#include <cstdint>
#include <utility>
#include <string>
#include <vector>
#include <memory>
#include <experimental/string_view>
#include <experimental/optional>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <vector>
#include <list>
#include <memory>
#include <set>
#include <unordered_set>
#include <map>
#include <unordered_map>
#include <algorithm>
#include <utility>
#include <stdexcept>
#include <exception>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <functional>
#include <tuple>

// }}}

// {{{ defs
namespace rin {

using std::int8_t;
using std::int16_t;
using std::int32_t;
using std::int64_t;

using std::uint8_t;
using std::uint16_t;
using std::uint32_t;
using std::uint64_t;

using std::size_t;

using octect_t = uint8_t;

template <typename T>
using Opt = std::experimental::optional<T>;

// template <typename ...T>
// using Tuple = std::tuple<T...>;

using Str          = std::string;
using Str_Ref      = std::experimental::string_view;
using Str_List     = std::vector<Str>;
using Str_Ref_List = std::vector<Str_Ref>;

using hash_t    = uint64_t;

template <typename ...T>
using Arc = std::shared_ptr<T...>;

template <typename ...T>
using Wrc = std::weak_ptr<T...>;

template <typename ...T>
using Ptr = std::unique_ptr<T...>;

enum ord_t { LT, EQ, GT };

} // namespace rin

#define attr_ctrl(...)          __attribute__((__VA_ARGS__))

#define visisbility_default     visibility("default")
#define visisbility_hidden      visibility("hidden")

#define attr_export             attr_ctrl(visisbility_default)
#define attr_local              attr_ctrl(visisbility_hidden)
#define attr_unused             attr_ctrl(unused)
#define attr_use_ret            attr_ctrl(warn_unused_result)
#define attr_packed             attr_ctrl(packed)
#define attr_init_prio(prio)    attr_ctrl(constructor(prio))
#define attr_fini_prio(prio)    attr_ctrl(destructor(prio))
// }}}

// {{{ misc
namespace rin {

#define RIN_PIMPL(klass)   \
  class klass##Impl;        \
  friend class klass##Impl; \
  Ptr<klass##Impl>    impl

template <class T, class K>
static inline
auto find(const T &c, const K &k) {
  auto found = c.find(k);

  using mapped_type = std::decay_t<decltype(found->second)>;

  if (found == c.end())
    return Opt<mapped_type>();
  return Opt<mapped_type>(found->second);
}

template <class T, class K>
static inline
bool has(const T &c, const K &k) { return c.find(k) != c.end(); }

namespace details {

template <class Container>
struct push_helper
{
  template <class E>
  inline void operator ()(Container &c, const E &e)
  {
    c.push_back(e);
  }
};

} // namespace details

template <class Output
        , class Input
        , class F
        , class P = details::push_helper<Output>>
Output u_map(const Input &input,
             F f = [] (const auto &e) { return e; },
             P p = P())
{
  Output output;

  for (auto &&i : input)
    p(output, f(i));

  return output;
}

namespace details {

using deferred_operation_t = std::function<void (void)>;

class defer_s
{
  deferred_operation_t deferred_operations = [] { };
  bool                 marked_cancel       = false;
public:
  defer_s()
  { }

  template <class Lambda>
  defer_s(Lambda &&lambda) : deferred_operations(std::forward<Lambda>(lambda))
  { }

  defer_s(defer_s &&d)     = default;
  defer_s(const defer_s &) = delete;

  defer_s &operator =(const defer_s &) = delete;
  defer_s &operator =(defer_s &&)      = default;

  defer_s &cancel()
  {
    marked_cancel = true;

    return *this;
  }

  defer_s &uncancel()
  {
    marked_cancel = false;

    return *this;
  }

  defer_s &run_and_reset()
  {
    auto _ = std::move(*this);
    new (this) defer_s();

    return *this;
  }

private:
  void do_it()
  {
    deferred_operations();
    deferred_operations = [] { };
  }

public:
  ~defer_s() { if (!marked_cancel) do_it(); }
};

struct defer_helper_s
{
  template <class Lambda>
  inline defer_s operator +(Lambda &&lambda) const
  {
    return defer_s(std::forward<Lambda>(lambda));
  }
};

#define defer_do       ::rin::details::defer_helper_s() + []
#define defer_opt(...) ::rin::details::defer_helper_s() + [__VA_ARGS__]

#define optptr(v, alt) ({  auto *p = (v); p ? p : (alt); })

} // namespace details

} // namespace rin
// }}}

// {{{ debug

#ifndef RIN_RELEASE
#define RIN_DEBUG        1
#endif


namespace rin {

using namespace std::string_literals;

namespace details {

template <class T>
static inline
auto &unwrap(const T &t) { return t; }

template <size_t N>
static inline
const char *unwrap(const char (&str)[N]) { return str; }

static inline
const char *unwrap(const std::string &str) { return str.c_str(); }

static inline
const char *unwrap(const std::experimental::string_view &str)
{
  return str.data();
}

template <typename T, typename ...Args>
static inline
std::ostream &log_print_impl(std::ostream &os,
                        const char *fmt,
                        const T &t, const Args &...args)
{
  for (const char *iter = fmt; *iter; ++iter)
  {
    if (*iter != '%')
      os << *iter;
    else if (*++iter == '%')
        os << '%';
    else
      return log_print_impl(os << details::unwrap(t), iter + 1, args..., "<MISSING ARGUMENT>");
  }

  return os;
}

static inline
std::ostream &log_print_impl(std::ostream &os, const char *fmt)
{
  return os << fmt;
}

template <typename ...Args>
static inline
auto &log_print(std::ostream &os, Str_Ref fmt, const Args &...args)
{
  return log_print_impl(os, fmt.data(), args...);
}

static inline const char *
shortify_path(const char *path)
{
  for (auto *last_dash = path + std::strlen(path); last_dash != path; --last_dash)
  {
    if (*last_dash == '/')
      return last_dash + 1;
  }

  return path;
}

} // namespace details

using details::log_print;

#define panic(...)                      \
  do {                                  \
    log_error(__VA_ARGS__);             \
    throw std::runtime_error("Panic!"); \
  } while (false)

} // namespace rin

#define log_message(...) rin_log("\033[32mI\033[0m", ##__VA_ARGS__)
#define log_warning(...) rin_log("\033[35mW\033[0m", ##__VA_ARGS__)
#define log_error(...)   rin_log("\033[33mE\033[0m", ##__VA_ARGS__)

#ifdef RIN_DEBUG

#define debug_only    if (false) { } else
#define die_unless(p)  \
  do { if (p) { } else panic("assertion failed : `" #p "'!"); } while (false)
#define rin_log(cate, first, ...)                                                  \
  do {                                                                             \
    rin::log_print(std::cerr, "%s *** %s, %d, %s : "s + (first) + "\n"s,           \
                   cate, rin::details::shortify_path(__FILE__), __LINE__,          \
                   __func__ == "operator()"s ? "(...)" : __func__, ##__VA_ARGS__); \
  } while (false)

#else

#define debug_only                 if (true) { } else
#define die_unless(p)              do { } while (false)
#define rin_log(cate, first, ...)  do { } while (false)

#endif



namespace rin {

attr_export
Str_List split(const Str &line, const Str &set);

attr_export Str trim_right(const Str &poor_guy);
attr_export Str trim_left(const Str &poor_guy);
attr_export Str trim(const Str &poor_poor_guy);


} // namespace rin

// }}}


#endif // end of include guard: RIN_H_INCLUDED_BNX6SFLD



