// Lean compiler output
// Module: SSC.Syntax
// Imports: public import Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorIdx(lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorIdx___boxed(lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_var_elim___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_var_elim(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_lam_elim___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_lam_elim(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_app_elim___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_app_elim(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_es_elim___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_es_elim(lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_lean__ssc_SSC_instDecidableEqTerm_decEq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instDecidableEqTerm_decEq___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_lean__ssc_SSC_instDecidableEqTerm(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instDecidableEqTerm___boxed(lean_object*, lean_object*);
static const lean_string_object lp_lean__ssc_SSC_instReprTerm_repr___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "SSC.Term.var"};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__0 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__0_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__0_value)}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__1 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__1_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__1_value),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__2 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__2_value;
lean_object* lean_nat_to_int(lean_object*);
static lean_once_cell_t lp_lean__ssc_SSC_instReprTerm_repr___closed__3_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__3;
static lean_once_cell_t lp_lean__ssc_SSC_instReprTerm_repr___closed__4_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__4;
static const lean_string_object lp_lean__ssc_SSC_instReprTerm_repr___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "SSC.Term.lam"};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__5 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__5_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__5_value)}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__6 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__6_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__6_value),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__7 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__7_value;
static const lean_string_object lp_lean__ssc_SSC_instReprTerm_repr___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "SSC.Term.app"};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__8 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__8_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__8_value)}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__9 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__9_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__9_value),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__10 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__10_value;
static const lean_string_object lp_lean__ssc_SSC_instReprTerm_repr___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "SSC.Term.es"};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__11 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__11_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__11_value)}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__12 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__12_value;
static const lean_ctor_object lp_lean__ssc_SSC_instReprTerm_repr___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__12_value),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC_instReprTerm_repr___closed__13 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm_repr___closed__13_value;
lean_object* l_Nat_reprFast(lean_object*);
lean_object* l_Repr_addAppParen(lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instReprTerm_repr(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instReprTerm_repr___boxed(lean_object*, lean_object*);
static const lean_closure_object lp_lean__ssc_SSC_instReprTerm___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_closure_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 245}, .m_fun = (void*)lp_lean__ssc_SSC_instReprTerm_repr___boxed, .m_arity = 2, .m_num_fixed = 0, .m_objs = {} };
static const lean_object* lp_lean__ssc_SSC_instReprTerm___closed__0 = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm___closed__0_value;
LEAN_EXPORT const lean_object* lp_lean__ssc_SSC_instReprTerm = (const lean_object*)&lp_lean__ssc_SSC_instReprTerm___closed__0_value;
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_size(lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_size___boxed(lean_object*);
uint8_t lean_usize_dec_eq(size_t, size_t);
size_t lean_usize_sub(size_t, size_t);
lean_object* lean_array_uget_borrowed(lean_object*, size_t);
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_array_push(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_array_get_size(lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
size_t lean_usize_of_nat(lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_lean__ssc_SSC_fv___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_lean__ssc_SSC_fv___closed__0;
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_fv(lean_object*);
lean_object* l_List_appendTR___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_fv___boxed(lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_shfv(lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_shfv___boxed(lean_object*);
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 4, .m_capacity = 4, .m_length = 3, .m_data = "SSC"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__0 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__0_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 10, .m_data = "term_[_↦_]"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__1 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__1_value;
lean_object* l_Lean_Name_mkStr2(lean_object*, lean_object*);
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__0_value),LEAN_SCALAR_PTR_LITERAL(31, 243, 102, 247, 57, 69, 10, 183)}};
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2_value_aux_0),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__1_value),LEAN_SCALAR_PTR_LITERAL(140, 61, 6, 9, 185, 240, 101, 231)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "andthen"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__3 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__3_value;
lean_object* l_Lean_Name_mkStr1(lean_object*);
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__3_value),LEAN_SCALAR_PTR_LITERAL(40, 255, 78, 30, 143, 119, 117, 174)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "["};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__5 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__5_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__5_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__6 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__6_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "term"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__7 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__7_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__7_value),LEAN_SCALAR_PTR_LITERAL(187, 230, 181, 162, 253, 146, 122, 119)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__8 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__8_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 7}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__8_value),((lean_object*)(((size_t)(0) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__9 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__9_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 2}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__6_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__9_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__10 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__10_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 4, .m_capacity = 4, .m_length = 1, .m_data = "↦"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__11 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__11_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__11_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__12 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__12_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 2}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__10_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__12_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__13 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__13_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 2}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__13_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__9_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__14 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__14_value;
static const lean_string_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "]"};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__15 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__15_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__16_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 5}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__15_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__16 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__16_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__17_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 2}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__4_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__14_value),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__16_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__17 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__17_value;
static const lean_ctor_object lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__18_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*4 + 0, .m_other = 4, .m_tag = 4}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2_value),((lean_object*)(((size_t)(70) << 1) | 1)),((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__17_value)}};
static const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__18 = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__18_value;
LEAN_EXPORT const lean_object* lp_lean__ssc_SSC_term___x5b___u21a6___x5d = (const lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__18_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Lean"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__0 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__0_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "Parser"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__1 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__1_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Term"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 4, .m_capacity = 4, .m_length = 3, .m_data = "app"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__3 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__3_value;
lean_object* l_Lean_Name_mkStr4(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_0),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_1),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(75, 170, 162, 138, 136, 204, 251, 229)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value_aux_2),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__3_value),LEAN_SCALAR_PTR_LITERAL(69, 118, 10, 41, 220, 156, 243, 179)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "Term.es"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__5 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__5_value;
lean_object* l_String_toRawSubstring_x27(lean_object*);
static lean_once_cell_t lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 3, .m_capacity = 3, .m_length = 2, .m_data = "es"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__7 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__7_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(63, 49, 83, 64, 196, 134, 248, 255)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8_value_aux_0),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__7_value),LEAN_SCALAR_PTR_LITERAL(77, 141, 42, 182, 14, 92, 179, 253)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8_value;
lean_object* l_Lean_Name_mkStr3(lean_object*, lean_object*, lean_object*);
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__0_value),LEAN_SCALAR_PTR_LITERAL(31, 243, 102, 247, 57, 69, 10, 183)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value_aux_0),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(179, 216, 187, 168, 45, 241, 6, 119)}};
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value_aux_1),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__7_value),LEAN_SCALAR_PTR_LITERAL(121, 57, 175, 228, 25, 243, 85, 110)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value),((lean_object*)(((size_t)(0) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__10 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__10_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 0}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__9_value)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__11 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__11_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__11_value),((lean_object*)(((size_t)(0) << 1) | 1))}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__12 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__12_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__10_value),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__12_value)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__13 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__13_value;
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "null"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__14 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__14_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__14_value),LEAN_SCALAR_PTR_LITERAL(24, 58, 49, 223, 146, 207, 197, 136)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__15 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__15_value;
uint8_t l_Lean_Syntax_isOfKind(lean_object*, lean_object*);
lean_object* l_Lean_Syntax_getArg(lean_object*, lean_object*);
lean_object* l_Lean_SourceInfo_fromRef(lean_object*, uint8_t);
lean_object* l_Lean_addMacroScope(lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_Syntax_node3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_Syntax_node2(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1(lean_object*, lean_object*, lean_object*);
static const lean_string_object lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "ident"};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__0 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__0_value;
static const lean_ctor_object lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(52, 159, 208, 51, 14, 60, 6, 71)}};
static const lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__1 = (const lean_object*)&lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__1_value;
uint8_t l_Lean_Syntax_matchesNull(lean_object*, lean_object*);
lean_object* l_Lean_replaceRef(lean_object*, lean_object*);
lean_object* l_Lean_Syntax_node6(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorIdx(lean_object* x_1) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
case 2:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(2u);
return x_4;
}
default: 
{
lean_object* x_5; 
x_5 = lean_unsigned_to_nat(3u);
return x_5;
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_lean__ssc_SSC_Term_ctorIdx(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
lean_dec_ref(x_1);
x_4 = lean_apply_1(x_2, x_3);
return x_4;
}
case 1:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_5 = lean_ctor_get(x_1, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_6);
lean_dec_ref(x_1);
x_7 = lean_apply_2(x_2, x_5, x_6);
return x_7;
}
case 2:
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_8);
x_9 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_9);
lean_dec_ref(x_1);
x_10 = lean_apply_2(x_2, x_8, x_9);
return x_10;
}
default: 
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_11 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_11);
x_12 = lean_ctor_get(x_1, 1);
lean_inc(x_12);
x_13 = lean_ctor_get(x_1, 2);
lean_inc_ref(x_13);
lean_dec_ref(x_1);
x_14 = lean_apply_3(x_2, x_11, x_12, x_13);
return x_14;
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
lean_object* x_6; 
x_6 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_3, x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_ctorElim___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
lean_object* x_6; 
x_6 = lp_lean__ssc_SSC_Term_ctorElim(x_1, x_2, x_3, x_4, x_5);
lean_dec(x_2);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_var_elim___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_var_elim(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_2, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_lam_elim___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_lam_elim(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_2, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_app_elim___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_app_elim(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_2, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_es_elim___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_Term_es_elim(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_lean__ssc_SSC_Term_ctorElim___redArg(x_2, x_4);
return x_5;
}
}
LEAN_EXPORT uint8_t lp_lean__ssc_SSC_instDecidableEqTerm_decEq(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_2, 0);
x_5 = lean_nat_dec_eq(x_3, x_4);
return x_5;
}
else
{
uint8_t x_6; 
x_6 = 0;
return x_6;
}
}
case 1:
{
if (lean_obj_tag(x_2) == 1)
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; 
x_7 = lean_ctor_get(x_1, 0);
x_8 = lean_ctor_get(x_1, 1);
x_9 = lean_ctor_get(x_2, 0);
x_10 = lean_ctor_get(x_2, 1);
x_11 = lean_nat_dec_eq(x_7, x_9);
if (x_11 == 0)
{
return x_11;
}
else
{
x_1 = x_8;
x_2 = x_10;
goto _start;
}
}
else
{
uint8_t x_13; 
x_13 = 0;
return x_13;
}
}
case 2:
{
if (lean_obj_tag(x_2) == 2)
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_14 = lean_ctor_get(x_1, 0);
x_15 = lean_ctor_get(x_1, 1);
x_16 = lean_ctor_get(x_2, 0);
x_17 = lean_ctor_get(x_2, 1);
x_18 = lp_lean__ssc_SSC_instDecidableEqTerm_decEq(x_14, x_16);
if (x_18 == 0)
{
return x_18;
}
else
{
x_1 = x_15;
x_2 = x_17;
goto _start;
}
}
else
{
uint8_t x_20; 
x_20 = 0;
return x_20;
}
}
default: 
{
if (lean_obj_tag(x_2) == 3)
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; uint8_t x_27; 
x_21 = lean_ctor_get(x_1, 0);
x_22 = lean_ctor_get(x_1, 1);
x_23 = lean_ctor_get(x_1, 2);
x_24 = lean_ctor_get(x_2, 0);
x_25 = lean_ctor_get(x_2, 1);
x_26 = lean_ctor_get(x_2, 2);
x_27 = lp_lean__ssc_SSC_instDecidableEqTerm_decEq(x_21, x_24);
if (x_27 == 0)
{
return x_27;
}
else
{
uint8_t x_28; 
x_28 = lean_nat_dec_eq(x_22, x_25);
if (x_28 == 0)
{
return x_28;
}
else
{
x_1 = x_23;
x_2 = x_26;
goto _start;
}
}
}
else
{
uint8_t x_30; 
x_30 = 0;
return x_30;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instDecidableEqTerm_decEq___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lp_lean__ssc_SSC_instDecidableEqTerm_decEq(x_1, x_2);
lean_dec_ref(x_2);
lean_dec_ref(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t lp_lean__ssc_SSC_instDecidableEqTerm(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = lp_lean__ssc_SSC_instDecidableEqTerm_decEq(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instDecidableEqTerm___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lp_lean__ssc_SSC_instDecidableEqTerm(x_1, x_2);
lean_dec_ref(x_2);
lean_dec_ref(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
static lean_object* _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__3(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__4(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instReprTerm_repr(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_15; uint8_t x_16; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 x_4 = x_1;
} else {
 lean_dec_ref(x_1);
 x_4 = lean_box(0);
}
x_15 = lean_unsigned_to_nat(1024u);
x_16 = lean_nat_dec_le(x_15, x_2);
if (x_16 == 0)
{
lean_object* x_17; 
x_17 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__3, &lp_lean__ssc_SSC_instReprTerm_repr___closed__3_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__3);
x_5 = x_17;
goto block_14;
}
else
{
lean_object* x_18; 
x_18 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__4, &lp_lean__ssc_SSC_instReprTerm_repr___closed__4_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__4);
x_5 = x_18;
goto block_14;
}
block_14:
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; lean_object* x_12; lean_object* x_13; 
x_6 = ((lean_object*)(lp_lean__ssc_SSC_instReprTerm_repr___closed__2));
x_7 = l_Nat_reprFast(x_3);
if (lean_is_scalar(x_4)) {
 x_8 = lean_alloc_ctor(3, 1, 0);
} else {
 x_8 = x_4;
 lean_ctor_set_tag(x_8, 3);
}
lean_ctor_set(x_8, 0, x_7);
x_9 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_9, 0, x_6);
lean_ctor_set(x_9, 1, x_8);
x_10 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_10, 0, x_5);
lean_ctor_set(x_10, 1, x_9);
x_11 = 0;
x_12 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_12, 0, x_10);
lean_ctor_set_uint8(x_12, sizeof(void*)*1, x_11);
x_13 = l_Repr_addAppParen(x_12, x_2);
return x_13;
}
}
case 1:
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; uint8_t x_37; 
x_19 = lean_ctor_get(x_1, 0);
lean_inc(x_19);
x_20 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_20);
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 lean_ctor_release(x_1, 1);
 x_21 = x_1;
} else {
 lean_dec_ref(x_1);
 x_21 = lean_box(0);
}
x_22 = lean_unsigned_to_nat(1024u);
x_37 = lean_nat_dec_le(x_22, x_2);
if (x_37 == 0)
{
lean_object* x_38; 
x_38 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__3, &lp_lean__ssc_SSC_instReprTerm_repr___closed__3_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__3);
x_23 = x_38;
goto block_36;
}
else
{
lean_object* x_39; 
x_39 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__4, &lp_lean__ssc_SSC_instReprTerm_repr___closed__4_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__4);
x_23 = x_39;
goto block_36;
}
block_36:
{
lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; uint8_t x_33; lean_object* x_34; lean_object* x_35; 
x_24 = lean_box(1);
x_25 = ((lean_object*)(lp_lean__ssc_SSC_instReprTerm_repr___closed__7));
x_26 = l_Nat_reprFast(x_19);
x_27 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_27, 0, x_26);
if (lean_is_scalar(x_21)) {
 x_28 = lean_alloc_ctor(5, 2, 0);
} else {
 x_28 = x_21;
 lean_ctor_set_tag(x_28, 5);
}
lean_ctor_set(x_28, 0, x_25);
lean_ctor_set(x_28, 1, x_27);
x_29 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_29, 0, x_28);
lean_ctor_set(x_29, 1, x_24);
x_30 = lp_lean__ssc_SSC_instReprTerm_repr(x_20, x_22);
x_31 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_31, 0, x_29);
lean_ctor_set(x_31, 1, x_30);
x_32 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_32, 0, x_23);
lean_ctor_set(x_32, 1, x_31);
x_33 = 0;
x_34 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_34, 0, x_32);
lean_ctor_set_uint8(x_34, sizeof(void*)*1, x_33);
x_35 = l_Repr_addAppParen(x_34, x_2);
return x_35;
}
}
case 2:
{
lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; uint8_t x_57; 
x_40 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_40);
x_41 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_41);
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 lean_ctor_release(x_1, 1);
 x_42 = x_1;
} else {
 lean_dec_ref(x_1);
 x_42 = lean_box(0);
}
x_43 = lean_unsigned_to_nat(1024u);
x_57 = lean_nat_dec_le(x_43, x_2);
if (x_57 == 0)
{
lean_object* x_58; 
x_58 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__3, &lp_lean__ssc_SSC_instReprTerm_repr___closed__3_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__3);
x_44 = x_58;
goto block_56;
}
else
{
lean_object* x_59; 
x_59 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__4, &lp_lean__ssc_SSC_instReprTerm_repr___closed__4_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__4);
x_44 = x_59;
goto block_56;
}
block_56:
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; lean_object* x_49; lean_object* x_50; lean_object* x_51; lean_object* x_52; uint8_t x_53; lean_object* x_54; lean_object* x_55; 
x_45 = lean_box(1);
x_46 = ((lean_object*)(lp_lean__ssc_SSC_instReprTerm_repr___closed__10));
x_47 = lp_lean__ssc_SSC_instReprTerm_repr(x_40, x_43);
if (lean_is_scalar(x_42)) {
 x_48 = lean_alloc_ctor(5, 2, 0);
} else {
 x_48 = x_42;
 lean_ctor_set_tag(x_48, 5);
}
lean_ctor_set(x_48, 0, x_46);
lean_ctor_set(x_48, 1, x_47);
x_49 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_49, 0, x_48);
lean_ctor_set(x_49, 1, x_45);
x_50 = lp_lean__ssc_SSC_instReprTerm_repr(x_41, x_43);
x_51 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_51, 0, x_49);
lean_ctor_set(x_51, 1, x_50);
x_52 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_52, 0, x_44);
lean_ctor_set(x_52, 1, x_51);
x_53 = 0;
x_54 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_54, 0, x_52);
lean_ctor_set_uint8(x_54, sizeof(void*)*1, x_53);
x_55 = l_Repr_addAppParen(x_54, x_2);
return x_55;
}
}
default: 
{
lean_object* x_60; lean_object* x_61; lean_object* x_62; lean_object* x_63; lean_object* x_64; uint8_t x_81; 
x_60 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_60);
x_61 = lean_ctor_get(x_1, 1);
lean_inc(x_61);
x_62 = lean_ctor_get(x_1, 2);
lean_inc_ref(x_62);
lean_dec_ref(x_1);
x_63 = lean_unsigned_to_nat(1024u);
x_81 = lean_nat_dec_le(x_63, x_2);
if (x_81 == 0)
{
lean_object* x_82; 
x_82 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__3, &lp_lean__ssc_SSC_instReprTerm_repr___closed__3_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__3);
x_64 = x_82;
goto block_80;
}
else
{
lean_object* x_83; 
x_83 = lean_obj_once(&lp_lean__ssc_SSC_instReprTerm_repr___closed__4, &lp_lean__ssc_SSC_instReprTerm_repr___closed__4_once, _init_lp_lean__ssc_SSC_instReprTerm_repr___closed__4);
x_64 = x_83;
goto block_80;
}
block_80:
{
lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; lean_object* x_74; lean_object* x_75; lean_object* x_76; uint8_t x_77; lean_object* x_78; lean_object* x_79; 
x_65 = lean_box(1);
x_66 = ((lean_object*)(lp_lean__ssc_SSC_instReprTerm_repr___closed__13));
x_67 = lp_lean__ssc_SSC_instReprTerm_repr(x_60, x_63);
x_68 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_68, 0, x_66);
lean_ctor_set(x_68, 1, x_67);
x_69 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_69, 0, x_68);
lean_ctor_set(x_69, 1, x_65);
x_70 = l_Nat_reprFast(x_61);
x_71 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_71, 0, x_70);
x_72 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_72, 0, x_69);
lean_ctor_set(x_72, 1, x_71);
x_73 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_73, 0, x_72);
lean_ctor_set(x_73, 1, x_65);
x_74 = lp_lean__ssc_SSC_instReprTerm_repr(x_62, x_63);
x_75 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_75, 0, x_73);
lean_ctor_set(x_75, 1, x_74);
x_76 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_76, 0, x_64);
lean_ctor_set(x_76, 1, x_75);
x_77 = 0;
x_78 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_78, 0, x_76);
lean_ctor_set_uint8(x_78, sizeof(void*)*1, x_77);
x_79 = l_Repr_addAppParen(x_78, x_2);
return x_79;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_instReprTerm_repr___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_lean__ssc_SSC_instReprTerm_repr(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_size(lean_object* x_1) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(1u);
return x_2;
}
case 1:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_3 = lean_ctor_get(x_1, 1);
x_4 = lean_unsigned_to_nat(1u);
x_5 = lp_lean__ssc_SSC_size(x_3);
x_6 = lean_nat_add(x_4, x_5);
lean_dec(x_5);
return x_6;
}
case 2:
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_7 = lean_ctor_get(x_1, 0);
x_8 = lean_ctor_get(x_1, 1);
x_9 = lean_unsigned_to_nat(1u);
x_10 = lp_lean__ssc_SSC_size(x_7);
x_11 = lean_nat_add(x_9, x_10);
lean_dec(x_10);
x_12 = lp_lean__ssc_SSC_size(x_8);
x_13 = lean_nat_add(x_11, x_12);
lean_dec(x_12);
lean_dec(x_11);
return x_13;
}
default: 
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; 
x_14 = lean_ctor_get(x_1, 0);
x_15 = lean_ctor_get(x_1, 2);
x_16 = lean_unsigned_to_nat(1u);
x_17 = lp_lean__ssc_SSC_size(x_14);
x_18 = lean_nat_add(x_16, x_17);
lean_dec(x_17);
x_19 = lp_lean__ssc_SSC_size(x_15);
x_20 = lean_nat_add(x_18, x_19);
lean_dec(x_19);
lean_dec(x_18);
return x_20;
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_size___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_lean__ssc_SSC_size(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0(lean_object* x_1, size_t x_2, size_t x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_usize_dec_eq(x_2, x_3);
if (x_5 == 0)
{
size_t x_6; size_t x_7; lean_object* x_8; lean_object* x_9; 
x_6 = 1;
x_7 = lean_usize_sub(x_2, x_6);
x_8 = lean_array_uget_borrowed(x_1, x_7);
lean_inc(x_8);
x_9 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_9, 0, x_8);
lean_ctor_set(x_9, 1, x_4);
x_2 = x_7;
x_4 = x_9;
goto _start;
}
else
{
return x_4;
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
size_t x_5; size_t x_6; lean_object* x_7; 
x_5 = lean_unbox_usize(x_2);
lean_dec(x_2);
x_6 = lean_unbox_usize(x_3);
lean_dec(x_3);
x_7 = lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0(x_1, x_5, x_6, x_4);
lean_dec_ref(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
if (lean_obj_tag(x_3) == 0)
{
lean_dec_ref(x_4);
lean_inc(x_1);
return x_1;
}
else
{
lean_object* x_5; lean_object* x_6; uint8_t x_7; 
x_5 = lean_ctor_get(x_3, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_3, 1);
lean_inc(x_6);
lean_dec_ref(x_3);
x_7 = lean_nat_dec_eq(x_5, x_2);
if (x_7 == 0)
{
lean_object* x_8; 
x_8 = lean_array_push(x_4, x_5);
x_3 = x_6;
x_4 = x_8;
goto _start;
}
else
{
lean_object* x_10; lean_object* x_11; uint8_t x_12; 
lean_dec(x_5);
x_10 = lean_array_get_size(x_4);
x_11 = lean_unsigned_to_nat(0u);
x_12 = lean_nat_dec_lt(x_11, x_10);
if (x_12 == 0)
{
lean_dec_ref(x_4);
return x_6;
}
else
{
size_t x_13; size_t x_14; lean_object* x_15; 
x_13 = lean_usize_of_nat(x_10);
x_14 = 0;
x_15 = lp_lean__ssc___private_Init_Data_Array_Basic_0__Array_foldrMUnsafe_fold___at___00__private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0_spec__0(x_4, x_13, x_14, x_6);
lean_dec_ref(x_4);
return x_15;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(x_1, x_2, x_3, x_4);
lean_dec(x_2);
lean_dec(x_1);
return x_5;
}
}
static lean_object* _init_lp_lean__ssc_SSC_fv___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_fv(lean_object* x_1) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_2 = lean_ctor_get(x_1, 0);
x_3 = lean_box(0);
lean_inc(x_2);
x_4 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_4, 0, x_2);
lean_ctor_set(x_4, 1, x_3);
return x_4;
}
case 1:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lp_lean__ssc_SSC_fv(x_6);
x_8 = lean_obj_once(&lp_lean__ssc_SSC_fv___closed__0, &lp_lean__ssc_SSC_fv___closed__0_once, _init_lp_lean__ssc_SSC_fv___closed__0);
lean_inc(x_7);
x_9 = lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(x_7, x_5, x_7, x_8);
lean_dec(x_7);
return x_9;
}
case 2:
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_10 = lean_ctor_get(x_1, 0);
x_11 = lean_ctor_get(x_1, 1);
x_12 = lp_lean__ssc_SSC_fv(x_10);
x_13 = lp_lean__ssc_SSC_fv(x_11);
x_14 = l_List_appendTR___redArg(x_12, x_13);
return x_14;
}
default: 
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_15 = lean_ctor_get(x_1, 0);
x_16 = lean_ctor_get(x_1, 1);
x_17 = lean_ctor_get(x_1, 2);
x_18 = lp_lean__ssc_SSC_fv(x_15);
x_19 = lean_obj_once(&lp_lean__ssc_SSC_fv___closed__0, &lp_lean__ssc_SSC_fv___closed__0_once, _init_lp_lean__ssc_SSC_fv___closed__0);
lean_inc(x_18);
x_20 = lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(x_18, x_16, x_18, x_19);
lean_dec(x_18);
x_21 = lp_lean__ssc_SSC_fv(x_17);
x_22 = l_List_appendTR___redArg(x_20, x_21);
return x_22;
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_fv___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_lean__ssc_SSC_fv(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_shfv(lean_object* x_1) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_2 = lean_ctor_get(x_1, 0);
x_3 = lean_box(0);
lean_inc(x_2);
x_4 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_4, 0, x_2);
lean_ctor_set(x_4, 1, x_3);
return x_4;
}
case 1:
{
lean_object* x_5; 
x_5 = lean_box(0);
return x_5;
}
case 2:
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_6 = lean_ctor_get(x_1, 0);
x_7 = lean_ctor_get(x_1, 1);
x_8 = lp_lean__ssc_SSC_shfv(x_6);
x_9 = lp_lean__ssc_SSC_shfv(x_7);
x_10 = l_List_appendTR___redArg(x_8, x_9);
return x_10;
}
default: 
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; 
x_11 = lean_ctor_get(x_1, 0);
x_12 = lean_ctor_get(x_1, 1);
x_13 = lean_ctor_get(x_1, 2);
x_14 = lp_lean__ssc_SSC_shfv(x_11);
x_15 = lean_obj_once(&lp_lean__ssc_SSC_fv___closed__0, &lp_lean__ssc_SSC_fv___closed__0_once, _init_lp_lean__ssc_SSC_fv___closed__0);
lean_inc(x_14);
x_16 = lp_lean__ssc___private_Init_Data_List_Impl_0__List_eraseTR_go___at___00SSC_fv_spec__0(x_14, x_12, x_14, x_15);
lean_dec(x_14);
x_17 = lp_lean__ssc_SSC_fv(x_13);
x_18 = l_List_appendTR___redArg(x_16, x_17);
return x_18;
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC_shfv___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_lean__ssc_SSC_shfv(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
static lean_object* _init_lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__5));
x_2 = l_String_toRawSubstring_x27(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = ((lean_object*)(lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2));
lean_inc(x_1);
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec_ref(x_2);
lean_dec(x_1);
x_6 = lean_box(1);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; uint8_t x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; 
x_8 = lean_ctor_get(x_2, 1);
lean_inc(x_8);
x_9 = lean_ctor_get(x_2, 2);
lean_inc(x_9);
x_10 = lean_ctor_get(x_2, 5);
lean_inc(x_10);
lean_dec_ref(x_2);
x_11 = lean_unsigned_to_nat(0u);
x_12 = l_Lean_Syntax_getArg(x_1, x_11);
x_13 = lean_unsigned_to_nat(2u);
x_14 = l_Lean_Syntax_getArg(x_1, x_13);
x_15 = lean_unsigned_to_nat(4u);
x_16 = l_Lean_Syntax_getArg(x_1, x_15);
lean_dec(x_1);
x_17 = 0;
x_18 = l_Lean_SourceInfo_fromRef(x_10, x_17);
lean_dec(x_10);
x_19 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4));
x_20 = lean_obj_once(&lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6, &lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6_once, _init_lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__6);
x_21 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__8));
x_22 = l_Lean_addMacroScope(x_8, x_21, x_9);
x_23 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__13));
lean_inc(x_18);
x_24 = lean_alloc_ctor(3, 4, 0);
lean_ctor_set(x_24, 0, x_18);
lean_ctor_set(x_24, 1, x_20);
lean_ctor_set(x_24, 2, x_22);
lean_ctor_set(x_24, 3, x_23);
x_25 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__15));
lean_inc(x_18);
x_26 = l_Lean_Syntax_node3(x_18, x_25, x_12, x_14, x_16);
x_27 = l_Lean_Syntax_node2(x_18, x_19, x_24, x_26);
x_28 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_28, 0, x_27);
lean_ctor_set(x_28, 1, x_3);
return x_28;
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______macroRules__SSC__term___x5b___u21a6___x5d__1___closed__4));
lean_inc(x_1);
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_1);
x_6 = lean_box(0);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; 
x_8 = lean_unsigned_to_nat(0u);
x_9 = l_Lean_Syntax_getArg(x_1, x_8);
x_10 = ((lean_object*)(lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___closed__1));
lean_inc(x_9);
x_11 = l_Lean_Syntax_isOfKind(x_9, x_10);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; 
lean_dec(x_9);
lean_dec(x_1);
x_12 = lean_box(0);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_3);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_14 = lean_unsigned_to_nat(1u);
x_15 = l_Lean_Syntax_getArg(x_1, x_14);
lean_dec(x_1);
x_16 = lean_unsigned_to_nat(3u);
lean_inc(x_15);
x_17 = l_Lean_Syntax_matchesNull(x_15, x_16);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
lean_dec(x_15);
lean_dec(x_9);
x_18 = lean_box(0);
x_19 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_19, 0, x_18);
lean_ctor_set(x_19, 1, x_3);
return x_19;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; uint8_t x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; 
x_20 = l_Lean_Syntax_getArg(x_15, x_8);
x_21 = l_Lean_Syntax_getArg(x_15, x_14);
x_22 = lean_unsigned_to_nat(2u);
x_23 = l_Lean_Syntax_getArg(x_15, x_22);
lean_dec(x_15);
x_24 = l_Lean_replaceRef(x_9, x_2);
lean_dec(x_9);
x_25 = 0;
x_26 = l_Lean_SourceInfo_fromRef(x_24, x_25);
lean_dec(x_24);
x_27 = ((lean_object*)(lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__2));
x_28 = ((lean_object*)(lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__5));
lean_inc(x_26);
x_29 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_29, 0, x_26);
lean_ctor_set(x_29, 1, x_28);
x_30 = ((lean_object*)(lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__11));
lean_inc(x_26);
x_31 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_31, 0, x_26);
lean_ctor_set(x_31, 1, x_30);
x_32 = ((lean_object*)(lp_lean__ssc_SSC_term___x5b___u21a6___x5d___closed__15));
lean_inc(x_26);
x_33 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_33, 0, x_26);
lean_ctor_set(x_33, 1, x_32);
x_34 = l_Lean_Syntax_node6(x_26, x_27, x_20, x_29, x_21, x_31, x_23, x_33);
x_35 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_35, 0, x_34);
lean_ctor_set(x_35, 1, x_3);
return x_35;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_lean__ssc_SSC___aux__SSC__Syntax______unexpand__SSC__Term__es__1(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_lean__ssc_SSC_Syntax(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
