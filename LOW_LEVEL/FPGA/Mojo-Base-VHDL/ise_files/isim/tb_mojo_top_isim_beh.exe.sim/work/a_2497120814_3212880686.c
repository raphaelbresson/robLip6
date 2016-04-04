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
static const char *ng0 = "/home/raphael/Desktop/Mojo-Base-VHDL/ise_files/Lidar.vhd";



static void work_a_2497120814_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(76, ng0);

LAB3:    t1 = (t0 + 3260U);
    t2 = *((char **)t1);
    t1 = (t0 + 5460);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5384);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2497120814_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(77, ng0);

LAB3:    t1 = (t0 + 3444U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5496);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5392);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2497120814_3212880686_p_2(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    int t18;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 1144U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    if (t7 == 1)
        goto LAB11;

LAB12:    t4 = (t0 + 1144U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)4);
    t3 = t10;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t4 = (t0 + 1144U);
    t11 = *((char **)t4);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)6);
    t2 = t13;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 1144U);
    t14 = *((char **)t4);
    t15 = *((unsigned char *)t14);
    t16 = (t15 == (unsigned char)9);
    t1 = t16;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t4 = (t0 + 5400);
    *((int *)t4) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 2064U);
    t17 = *((char **)t4);
    t18 = *((int *)t17);
    t19 = (t18 - 1);
    t4 = (t0 + 5532);
    t20 = (t4 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    *((int *)t23) = t19;
    xsi_driver_first_trans_fast(t4);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

}

static void work_a_2497120814_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    int t33;
    int t34;
    int t35;
    char *t36;
    int t37;
    int t38;
    int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    int t44;
    int t45;
    int t46;
    char *t47;
    int t48;
    int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6, &&LAB7, &&LAB8, &&LAB9, &&LAB10, &&LAB11, &&LAB12};

LAB0:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 2616U);
    t2 = *((char **)t1);
    t1 = (t0 + 5604);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 2892U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5676);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5712);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 1788U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5748);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2340U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5784);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 3260U);
    t2 = *((char **)t1);
    t1 = (t0 + 5820);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5856);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 3444U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5892);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 5408);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(116, ng0);
    t4 = (t0 + 5892);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(123, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 1)
        goto LAB16;

LAB17:    t3 = (unsigned char)0;

LAB18:    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(143, ng0);
    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(144, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB14:    goto LAB2;

LAB5:    xsi_set_current_line(148, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(149, ng0);
    t1 = (t0 + 2064U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 > 0);
    if (t3 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(154, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(155, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(156, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB25:    goto LAB2;

LAB6:    xsi_set_current_line(160, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(161, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(162, ng0);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 1)
        goto LAB30;

LAB31:    t3 = (unsigned char)0;

LAB32:    if (t3 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(180, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(181, ng0);
    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(182, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB28:    goto LAB2;

LAB7:    xsi_set_current_line(186, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(187, ng0);
    t1 = (t0 + 2064U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 > 0);
    if (t3 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(192, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(193, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(194, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB39:    goto LAB2;

LAB8:    xsi_set_current_line(198, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(199, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(200, ng0);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 1)
        goto LAB44;

LAB45:    t3 = (unsigned char)0;

LAB46:    if (t3 != 0)
        goto LAB41;

LAB43:    xsi_set_current_line(212, ng0);
    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(213, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB42:    goto LAB2;

LAB9:    xsi_set_current_line(217, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(218, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(219, ng0);
    t1 = (t0 + 2064U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 > 0);
    if (t3 != 0)
        goto LAB50;

LAB52:    xsi_set_current_line(224, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(225, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(226, ng0);
    t1 = (t0 + 5748);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(227, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);

LAB51:    goto LAB2;

LAB10:    xsi_set_current_line(231, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(232, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(233, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(234, ng0);
    t1 = (t0 + 2524U);
    t2 = *((char **)t1);
    t1 = (t0 + 1788U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t16 = (t8 * 8);
    t17 = (t16 - 1);
    t1 = (t0 + 1788U);
    t5 = *((char **)t1);
    t18 = *((int *)t5);
    t19 = (t18 - 1);
    t20 = (t19 * 8);
    t21 = (t20 - t17);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t23 = (1U * t22);
    t3 = (t23 != 8U);
    if (t3 == 1)
        goto LAB53;

LAB54:    t1 = (t0 + 1788U);
    t6 = *((char **)t1);
    t24 = *((int *)t6);
    t25 = (t24 * 8);
    t26 = (t25 - 1);
    t27 = (15 - t26);
    t28 = (1U * t27);
    t29 = (0U + t28);
    t1 = (t0 + 5820);
    t7 = (t1 + 32U);
    t9 = *((char **)t7);
    t15 = (t9 + 32U);
    t30 = *((char **)t15);
    t31 = (t0 + 1788U);
    t32 = *((char **)t31);
    t33 = *((int *)t32);
    t34 = (t33 * 8);
    t35 = (t34 - 1);
    t31 = (t0 + 1788U);
    t36 = *((char **)t31);
    t37 = *((int *)t36);
    t38 = (t37 - 1);
    t39 = (t38 * 8);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    memcpy(t30, t2, t42);
    t31 = (t0 + 1788U);
    t43 = *((char **)t31);
    t44 = *((int *)t43);
    t45 = (t44 * 8);
    t46 = (t45 - 1);
    t31 = (t0 + 1788U);
    t47 = *((char **)t31);
    t48 = *((int *)t47);
    t49 = (t48 - 1);
    t50 = (t49 * 8);
    t51 = (t50 - t46);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t53 = (1U * t52);
    xsi_driver_first_trans_delta(t1, t29, t53, 0LL);
    xsi_set_current_line(235, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(238, ng0);
    t1 = (t0 + 3260U);
    t2 = *((char **)t1);
    t1 = (t0 + 5820);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(239, ng0);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 1)
        goto LAB58;

LAB59:    t3 = (unsigned char)0;

LAB60:    if (t3 != 0)
        goto LAB55;

LAB57:    xsi_set_current_line(252, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(253, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(254, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(255, ng0);
    t1 = (t0 + 2524U);
    t2 = *((char **)t1);
    t1 = (t0 + 1788U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t16 = (t8 * 8);
    t17 = (t16 - 1);
    t1 = (t0 + 1788U);
    t5 = *((char **)t1);
    t18 = *((int *)t5);
    t19 = (t18 - 1);
    t20 = (t19 * 8);
    t21 = (t20 - t17);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t23 = (1U * t22);
    t3 = (t23 != 8U);
    if (t3 == 1)
        goto LAB64;

LAB65:    t1 = (t0 + 1788U);
    t6 = *((char **)t1);
    t24 = *((int *)t6);
    t25 = (t24 * 8);
    t26 = (t25 - 1);
    t27 = (15 - t26);
    t28 = (1U * t27);
    t29 = (0U + t28);
    t1 = (t0 + 5820);
    t7 = (t1 + 32U);
    t9 = *((char **)t7);
    t15 = (t9 + 32U);
    t30 = *((char **)t15);
    t31 = (t0 + 1788U);
    t32 = *((char **)t31);
    t33 = *((int *)t32);
    t34 = (t33 * 8);
    t35 = (t34 - 1);
    t31 = (t0 + 1788U);
    t36 = *((char **)t31);
    t37 = *((int *)t36);
    t38 = (t37 - 1);
    t39 = (t38 * 8);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    memcpy(t30, t2, t42);
    t31 = (t0 + 1788U);
    t43 = *((char **)t31);
    t44 = *((int *)t43);
    t45 = (t44 * 8);
    t46 = (t45 - 1);
    t31 = (t0 + 1788U);
    t47 = *((char **)t31);
    t48 = *((int *)t47);
    t49 = (t48 - 1);
    t50 = (t49 * 8);
    t51 = (t50 - t46);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t53 = (1U * t52);
    xsi_driver_first_trans_delta(t1, t29, t53, 0LL);

LAB56:    goto LAB2;

LAB12:    xsi_set_current_line(259, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(260, ng0);
    t1 = (t0 + 2064U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 > 0);
    if (t3 != 0)
        goto LAB66;

LAB68:    xsi_set_current_line(265, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(266, ng0);
    t1 = (t0 + 5784);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(267, ng0);
    t1 = (t0 + 5748);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(268, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB67:    goto LAB2;

LAB13:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t8 = *((int *)t5);
    t14 = (t8 == 2);
    if (t14 != 0)
        goto LAB19;

LAB21:    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 == 1);
    if (t3 != 0)
        goto LAB22;

LAB23:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(137, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t4 = (t0 + 5640);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 5928);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1000000;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB20:    goto LAB14;

LAB16:    t1 = (t0 + 3076U);
    t4 = *((char **)t1);
    t12 = *((unsigned char *)t4);
    t13 = (t12 == (unsigned char)2);
    t3 = t13;
    goto LAB18;

LAB19:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 5568);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t15 = *((char **)t9);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(127, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t4 = (t0 + 5640);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(128, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(129, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(132, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t4 = (t0 + 5640);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB24:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5928);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(152, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

LAB27:    xsi_set_current_line(163, ng0);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t8 = *((int *)t5);
    t14 = (t8 == 2);
    if (t14 != 0)
        goto LAB33;

LAB35:    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 == 1);
    if (t3 != 0)
        goto LAB36;

LAB37:    xsi_set_current_line(174, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(176, ng0);
    t1 = (t0 + 5928);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1000000;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(177, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);

LAB34:    goto LAB28;

LAB30:    t1 = (t0 + 3076U);
    t4 = *((char **)t1);
    t12 = *((unsigned char *)t4);
    t13 = (t12 == (unsigned char)2);
    t3 = t13;
    goto LAB32;

LAB33:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 5568);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t15 = *((char **)t9);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(165, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(166, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(167, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB34;

LAB36:    xsi_set_current_line(169, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(170, ng0);
    t1 = (t0 + 3980U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(171, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(172, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB34;

LAB38:    xsi_set_current_line(188, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(189, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5928);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(190, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB39;

LAB41:    xsi_set_current_line(201, ng0);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t8 = *((int *)t5);
    t14 = (t8 == 1);
    if (t14 != 0)
        goto LAB47;

LAB49:    xsi_set_current_line(207, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(208, ng0);
    t1 = (t0 + 5928);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1000000;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);

LAB48:    goto LAB42;

LAB44:    t1 = (t0 + 3076U);
    t4 = *((char **)t1);
    t12 = *((unsigned char *)t4);
    t13 = (t12 == (unsigned char)2);
    t3 = t13;
    goto LAB46;

LAB47:    xsi_set_current_line(202, ng0);
    t1 = (t0 + 5568);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t15 = *((char **)t9);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(203, ng0);
    t1 = (t0 + 5712);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(204, ng0);
    t1 = (t0 + 4048U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(205, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB48;

LAB50:    xsi_set_current_line(220, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(221, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5928);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(222, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB51;

LAB53:    xsi_size_not_matching(t23, 8U, 0);
    goto LAB54;

LAB55:    xsi_set_current_line(240, ng0);
    t1 = (t0 + 1788U);
    t5 = *((char **)t1);
    t8 = *((int *)t5);
    t14 = (t8 > 1);
    if (t14 != 0)
        goto LAB61;

LAB63:    xsi_set_current_line(246, ng0);
    t1 = (t0 + 5892);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(247, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(248, ng0);
    t1 = (t0 + 5928);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((int *)t6) = 1000000;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(249, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)9;
    xsi_driver_first_trans_fast(t1);

LAB62:    goto LAB56;

LAB58:    t1 = (t0 + 3076U);
    t4 = *((char **)t1);
    t12 = *((unsigned char *)t4);
    t13 = (t12 == (unsigned char)2);
    t3 = t13;
    goto LAB60;

LAB61:    xsi_set_current_line(241, ng0);
    t1 = (t0 + 5892);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t15 = *((char **)t9);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(242, ng0);
    t1 = (t0 + 5568);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(243, ng0);
    t1 = (t0 + 1788U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t16 = (t8 - 1);
    t1 = (t0 + 5748);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t16;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(244, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB62;

LAB64:    xsi_size_not_matching(t23, 8U, 0);
    goto LAB65;

LAB66:    xsi_set_current_line(261, ng0);
    t1 = (t0 + 5568);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(262, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 5928);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(263, ng0);
    t1 = (t0 + 5856);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)9;
    xsi_driver_first_trans_fast(t1);
    goto LAB67;

}

static void work_a_2497120814_3212880686_p_4(char *t0)
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
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    int t14;

LAB0:    xsi_set_current_line(275, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 == (unsigned char)3);
    if (t10 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(276, ng0);
    t1 = (t0 + 5964);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(277, ng0);
    t1 = (t0 + 6000);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(278, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 6036);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(279, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 6072);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(280, ng0);
    t1 = (t0 + 6108);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(281, ng0);
    t1 = (t0 + 6144);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(282, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t5 = (t0 + 6180);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(283, ng0);
    t1 = (t0 + 6216);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(284, ng0);
    t1 = (t0 + 6252);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(285, ng0);
    t1 = (t0 + 6288);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(287, ng0);
    t5 = (t0 + 1328U);
    t6 = *((char **)t5);
    t12 = *((unsigned char *)t6);
    t5 = (t0 + 6000);
    t7 = (t5 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 32U);
    t13 = *((char **)t9);
    *((unsigned char *)t13) = t12;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(288, ng0);
    t1 = (t0 + 2432U);
    t2 = *((char **)t1);
    t1 = (t0 + 6036);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(289, ng0);
    t1 = (t0 + 2708U);
    t2 = *((char **)t1);
    t1 = (t0 + 6072);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(290, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t1 = (t0 + 6108);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((int *)t8) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(291, ng0);
    t1 = (t0 + 1696U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t1 = (t0 + 6144);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((int *)t8) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(292, ng0);
    t1 = (t0 + 2984U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6324);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(293, ng0);
    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    t1 = (t0 + 6180);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(294, ng0);
    t1 = (t0 + 1972U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t1 = (t0 + 6216);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((int *)t8) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(295, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6252);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(296, ng0);
    t1 = (t0 + 3352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6288);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(297, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5964);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t1 = (t0 + 568U);
    t11 = xsi_signal_has_event(t1);
    t3 = t11;
    goto LAB9;

}


extern void work_a_2497120814_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2497120814_3212880686_p_0,(void *)work_a_2497120814_3212880686_p_1,(void *)work_a_2497120814_3212880686_p_2,(void *)work_a_2497120814_3212880686_p_3,(void *)work_a_2497120814_3212880686_p_4};
	xsi_register_didat("work_a_2497120814_3212880686", "isim/tb_mojo_top_isim_beh.exe.sim/work/a_2497120814_3212880686.didat");
	xsi_register_executes(pe);
}
