/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/raphael/Desktop/HARDWARE/vhdl/PWM/pwm_mgr.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2110411308_1035706684(char *, char *, char *, char *, char *);


static void work_a_2557800970_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2600);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 2540);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2557800970_3212880686_p_1(char *t0)
{
    char t5[16];
    char t13[16];
    char t18[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2548);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1236U);
    t6 = *((char **)t1);
    t1 = (t0 + 4512U);
    t7 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t5, t6, t1, 1);
    t8 = (t0 + 2636);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    memcpy(t12, t7, 20U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t6 = ((IEEE_P_2592010699) + 2312);
    t7 = (t0 + 4496U);
    t1 = xsi_base_array_concat(t1, t13, t6, (char)99, (unsigned char)2, (char)97, t2, t7, (char)101);
    t8 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t5, t1, t13, 165);
    t9 = (t0 + 1236U);
    t10 = *((char **)t9);
    t14 = (20 - 1);
    t15 = (19 - t14);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t9 = (t10 + t17);
    t11 = (t18 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 19;
    t12 = (t11 + 4U);
    *((int *)t12) = 9;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t19 = (9 - 19);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t20;
    t3 = ieee_p_1242562249_sub_2110411308_1035706684(IEEE_P_1242562249, t8, t5, t9, t18);
    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2672);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(56, ng0);
    t12 = (t0 + 2672);
    t21 = (t12 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast(t12);
    goto LAB6;

}

static void work_a_2557800970_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t3 = xsi_signal_has_event(t1);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2556);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2708);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(70, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 2744);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1144U);
    t5 = *((char **)t2);
    t2 = (t0 + 2744);
    t6 = (t2 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 20U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2708);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}


extern void work_a_2557800970_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2557800970_3212880686_p_0,(void *)work_a_2557800970_3212880686_p_1,(void *)work_a_2557800970_3212880686_p_2};
	xsi_register_didat("work_a_2557800970_3212880686", "isim/tb_pwm_mgr_isim_beh.exe.sim/work/a_2557800970_3212880686.didat");
	xsi_register_executes(pe);
}
