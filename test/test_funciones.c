#include <check.h>
#include "../include/funciones.h"

START_TEST(test_sumar) {
    ck_assert_int_eq(sumar(2, 3), 5);
}
END_TEST

Suite* funciones_suite(void) {
    Suite *s = suite_create("Funciones");
    TCase *tc_core = tcase_create("Core");
    tcase_add_test(tc_core, test_sumar);
    suite_add_tcase(s, tc_core);
    return s;
}

int main(void) {
    int failed;
    Suite *s = funciones_suite();
    SRunner *sr = srunner_create(s);
    srunner_run_all(sr, CK_NORMAL);
    failed = srunner_ntests_failed(sr);
    srunner_free(sr);
    return (failed == 0) ? 0 : 1;
}
