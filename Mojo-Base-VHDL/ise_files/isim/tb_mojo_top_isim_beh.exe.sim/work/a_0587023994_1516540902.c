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
static const char *ng0 = "/home/raphael/Desktop/Mojo-Base-VHDL/src/cclk_detector.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3454299738_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0587023994_1516540902_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(42, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2396);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 2336);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0587023994_1516540902_p_1(char *t0)
{
    char t11[16];
    char t14[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    int t12;
    unsigned int t13;
    char *t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 2432);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)2);
    if (t7 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 4236U);
    t3 = (t0 + 4291);
    t5 = (t11 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 0;
    t8 = (t5 + 4U);
    *((int *)t8) = 12;
    t8 = (t5 + 8U);
    *((int *)t8) = 1;
    t12 = (12 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t13;
    t6 = ieee_p_1242562249_sub_3454299738_1035706684(IEEE_P_1242562249, t2, t1, t3, t11);
    if (t6 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 2468);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t8 = *((char **)t5);
    memcpy(t8, t2, 13U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 2432);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 2344);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t1 = xsi_get_transient_memory(13U);
    memset(t1, 0, 13U);
    t3 = t1;
    memset(t3, (unsigned char)2, 13U);
    t4 = (t0 + 2468);
    t5 = (t4 + 32U);
    t8 = *((char **)t5);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 13U);
    xsi_driver_first_trans_fast(t4);
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t8 = (t0 + 1052U);
    t9 = *((char **)t8);
    t8 = (t0 + 4236U);
    t10 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t14, t9, t8, 1);
    t15 = (t14 + 12U);
    t13 = *((unsigned int *)t15);
    t16 = (1U * t13);
    t7 = (13U != t16);
    if (t7 == 1)
        goto LAB7;

LAB8:    t17 = (t0 + 2468);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    memcpy(t21, t10, 13U);
    xsi_driver_first_trans_fast(t17);
    goto LAB3;

LAB7:    xsi_size_not_matching(13U, t16, 0);
    goto LAB8;

}

static void work_a_0587023994_1516540902_p_2(char *t0)
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
    char *t10;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2352);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t1 = xsi_get_transient_memory(13U);
    memset(t1, 0, 13U);
    t5 = t1;
    memset(t5, (unsigned char)2, 13U);
    t6 = (t0 + 2504);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 13U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2540);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 960U);
    t5 = *((char **)t2);
    t2 = (t0 + 2504);
    t6 = (t2 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 13U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2540);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}


extern void work_a_0587023994_1516540902_init()
{
	static char *pe[] = {(void *)work_a_0587023994_1516540902_p_0,(void *)work_a_0587023994_1516540902_p_1,(void *)work_a_0587023994_1516540902_p_2};
	xsi_register_didat("work_a_0587023994_1516540902", "isim/tb_mojo_top_isim_beh.exe.sim/work/a_0587023994_1516540902.didat");
	xsi_register_executes(pe);
}
