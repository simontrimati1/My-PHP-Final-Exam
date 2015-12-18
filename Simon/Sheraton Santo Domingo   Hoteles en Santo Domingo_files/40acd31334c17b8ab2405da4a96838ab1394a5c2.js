/*
 * Property List Definitions - edit these to add/remove IDs for a property
 * 
 * HOW TO USE:
 * Example usage in a conditional firing expression:
 *   BtStarwood.propertyMatch("APAC", [[Property ID]])
 *
 * Example usage as a DBE that evaluates to true or false: The data element from the data dictionary may then be
 * used as a conditional firing rule without any logic operators.
 *   BtStarwood.propertyMatch("LAD", s.prop1)
 *
 * HOW TO ADD NEW LISTS:
 *   Values are comma separated, with no comma following the last number 
 *   StarwoodProperties["name"] = [ value1, value2, value3 ];
 *
 * USING TO MATCH TEXT:
 * Place Values in "quotes"
 * StarwoodProperties["AdSafeMiddleEast"] = [
 * "United_Arab Emirates", "Israel", "Iraq", "Kuwait", "Lebanon", "Oman", "Palestinian Territory", "Qatar" ];
 * Ensure that the matching DBE is returning a string.
 *
 *BtStarwood.propertyMatch("AdSafeMiddleEast", document.getElementsByClassName("country last")[0].innerHTML
 *.toString())
 */

window.StarwoodProperties = {};
 /*LAD Last updated May 2015*/
StarwoodProperties["APAC"] = [
  20, 35, 107, 110, 121, 129, 140, 164, 172, 175, 180, 202, 276, 277, 278, 281, 283, 357, 361, 370, 372, 384, 422, 423, 429, 449, 471, 475, 482, 483, 485, 492, 735, 772, 956, 1056, 1057, 1060, 1061, 1062, 1063, 1064, 1119, 1134, 1158, 1183, 1185, 1191, 1192, 1296, 1305, 1349, 1365, 1372, 1379, 1394, 1422, 1427, 1438, 1443, 1446, 1447, 1449, 1451, 1460, 1463, 1482, 1484, 1489, 1533, 1540, 1545, 1549, 1577, 1578, 1585, 1590, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1716, 1825, 1826, 1827, 1828, 1831, 1832, 1833, 1834, 1837, 1840, 1841, 1842, 1846, 1848, 1935, 1944, 1945, 1946, 1950, 1954, 1962, 1964, 1965, 1966, 1967, 1968, 1969, 1972, 1973, 1986, 1988, 1996, 3000, 3005, 3009, 3010, 3016, 3017, 3018, 3024, 3031, 3058, 3078, 3091, 3092, 3096, 3110, 3116, 3117, 3118, 3119, 3120, 3121, 3126, 3129, 3157, 3158, 3159, 3160, 3182, 3191, 3198, 3199, 3200, 3202, 3203, 3211, 3217, 3218, 3219, 3221, 3226, 3245, 3248, 3258, 3274, 3275, 3276, 3277, 3307, 3309, 3310, 3314, 3316, 3342, 3346, 3358, 3360, 3372, 3376, 3377, 3378, 3384, 3385, 3387, 3388, 3392, 3394, 3398, 3399, 3409, 3412, 3413, 3414, 3415, 3424, 3437, 3440, 3442, 3446, 3447, 3449, 3452, 3453, 3462, 3465, 3473, 3474, 3475, 3476, 3480, 3482, 3494, 3499, 3500, 3501, 3502, 3503, 3504, 3507, 3522, 3523, 3524, 3526, 3528, 3529, 3531, 3537, 3538, 3541, 3542, 3545, 3546, 3556, 3557, 3558, 3559, 3564, 3565, 3569, 3570, 3571, 3572, 3573, 3577, 3580, 3582, 3583, 3584, 3595, 3596, 3597, 3598, 3599, 3601, 3602, 3607, 3608, 3609, 3611, 3612, 3613, 3617, 3621, 3624, 3625, 3627, 3633, 3635, 3649, 3650, 3651, 3652, 3653, 3655, 3657, 3658, 3659, 3671, 3672, 3673, 3680, 3682, 3683, 3687, 3689, 3690, 3691, 3696, 3697, 3698, 3699, 3701, 3702, 3708, 3713, 3714, 3717, 3723, 3726, 3737, 3739, 3744, 3745, 3747, 3751, 3757, 3758, 3765, 3767, 3770, 3775, 3781, 3782, 3785, 3788, 3791, 3792, 3793, 3794, 3795, 3796, 3797, 3800, 3808, 3809, 3810, 3815, 3816, 3823, 3824, 3825, 3826, 3827, 3828, 3830, 3831, 3832, 3833, 3834, 3835, 3839, 3840, 3841, 3842, 3854, 3858, 3862, 3864, 3868, 3873, 3878, 3879, 3881, 3882, 3886, 3887, 3888, 3893, 3900, 3910, 3915, 3916, 3918, 3921, 3922, 3924, 3925, 3927, 3928, 3931, 3933, 3934, 3935, 3944, 3945, 3946, 3947, 3949, 3953, 3954, 3960, 3967, 3970, 3973, 3974, 3975, 3976, 3977, 3989, 3990, 3995, 4000, 4008, 4009, 4010, 4012, 4014, 4015, 4016, 4019, 4025, 4027, 4028, 4029, 4034, 4036, 4037, 4038, 4044, 4046, 4050, 4051, 4053, 4054, 4056, 4061, 4062, 4063, 4064, 4074, 4076, 4078, 4081, 4082, 4083, 4084, 4099, 4100, 4103, 4104, 4106, 4108, 4110, 4117, 4118, 4119, 4124, 4126, 4129, 4133, 4134, 4135, 4139, 4144, 4145, 4146, 4151, 4172, 4173, 4176, 4178, 4182, 4185, 4187, 4188, 4190, 4195, 4196, 4197, 4212, 4213, 4214, 4215, 4216, 4217, 4218, 4221, 4223, 4224, 4226, 4227, 4228, 4229, 4233, 4236, 4239, 4245, 4260, 4261, 4263, 4267, 4269, 4270, 4271, 4274, 4276, 4279, 4283, 4301, 4304, 4307, 4308, 4309, 4312, 4314, 4315 

];
/*EMEA Last update May 2015*/
StarwoodProperties["EMEA"] = [
43, 45, 49, 53, 56, 59, 64, 66, 67, 70, 71, 72, 73, 75, 79, 86, 88, 89, 97, 98, 101, 105, 116, 118, 125, 132, 137, 141, 142, 143, 144, 145, 146, 147, 148, 149, 156, 167, 186, 199, 201, 224, 225, 239, 250, 268, 274, 292, 293, 295, 298, 301, 307, 316, 323, 326, 327, 331, 332, 343, 363, 386, 402, 406, 408, 409, 410, 412, 435, 438, 442, 445, 446, 466, 474, 481, 488, 497, 724, 931, 1105, 1106, 1107, 1109, 1117, 1127, 1136, 1140, 1157, 1160, 1186, 1194, 1202, 1230, 1239, 1252, 1274, 1288, 1314, 1326, 1345, 1347, 1353, 1358, 1359, 1397, 1403, 1407, 1414, 1437, 1439, 1445, 1454, 1458, 1462, 1464, 1467, 1468, 1477, 1478, 1480, 1483, 1487, 1539, 1541, 1553, 1572, 1584, 1722, 1729, 1741, 1742, 1778, 1782, 1800, 1802, 1807, 1808, 1810, 1811, 1817, 1818, 1852, 1853, 1854, 1856, 1857, 1860, 1861, 1863, 1864, 1866, 1878, 1886, 1887, 1888, 1889, 1890, 1893, 1894, 1895, 1897, 1898, 1899, 1900, 1901, 1918, 1919, 1921, 1924, 1925, 1931, 1936, 1937, 1947, 1956, 1975, 1983, 1984, 3014, 3022, 3028, 3032, 3034, 3037, 3057, 3066, 3080, 3081, 3090, 3093, 3094, 3104, 3105, 3106, 3137, 3138, 3183, 3188, 3216, 3222, 3242, 3262, 3263, 3265, 3268, 3270, 3281, 3289, 3290, 3306, 3330, 3338, 3340, 3341, 3345, 3354, 3357, 3365, 3366, 3400, 3401, 3429, 3430, 3431, 3434, 3459, 3461, 3464, 3477, 3484, 3485, 3486, 3487, 3530, 3552, 3555, 3561, 3562, 3563, 3566, 3567, 3579, 3590, 3591, 3592, 3594, 3604, 3618, 3661, 3662, 3663, 3664, 3665, 3666, 3667, 3668, 3669, 3688, 3692, 3704, 3731, 3732, 3733, 3734, 3741, 3742, 3778, 3779, 3780, 3787, 3790, 3811, 3812, 3813, 3817, 3818, 3819, 3820, 3821, 3822, 3829, 3843, 3860, 3861, 3869, 3877, 3885, 3889, 3890, 3891, 3911, 3912, 3913, 3914, 3917, 3920, 3929, 3956, 3962, 3963, 3964, 3965, 3966, 3972, 3991, 4004, 4005, 4006, 4023, 4024, 4032, 4041, 4045, 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4107, 4123, 4127, 4128, 4130, 4136, 4153, 4154, 4180, 4193, 4205, 4207, 4209, 4210, 4231, 4235, 4240, 4242, 4243, 4287, 4288, 4291, 4303

];

/*LAD Last updated March 2015*/
StarwoodProperties["LAD"] = [
  260, 233, 1195, 1286, 113, 108, 1733, 1152, 1701, 3681, 255, 1535, 3438, 1385, 1398, 3847, 3783, 3894, 296, 206, 1979, 1294, 3505, 1536, 3614, 651, 3600, 1554, 736, 3740, 3718, 4040, 3560, 3637, 3968, 1159, 766, 1597, 1075, 259, 1444, 1735, 3863, 238, 3099, 1087, 1298, 1090, 843, 1734, 303, 1441, 3228, 3930, 1092, 5646, 3987, 1094, 1376, 1507, 1381, 1378, 1377, 3495, 3897, 3738, 4137, 3012, 3259, 3693, 1769, 3386, 3610, 3630, 1450, 284, 3286, 3513, 3285, 3287, 3762, 1238, 1576, 1534, 3950, 4225, 3534, 4048, 3170, 1523, 1961, 1095, 1497, 1548, 1770, 3684, 3805, 3855, 1098, 1187, 1585, 1452, 4289, 3969
];

/*NAD Last updated May 2015*/
StarwoodProperties["Americas2014"] = [
  13, 15, 19, 33, 40, 48, 81, 83, 90, 91, 92, 94, 95, 96, 102, 103, 111, 115, 123, 127, 139, 158, 166, 171, 177, 185, 189, 193, 196, 197, 198, 205, 208, 212, 213, 214, 220, 221, 232, 244, 245, 247, 270, 271, 304, 315, 321, 341, 344, 347, 350, 353, 364, 373, 374, 376, 377, 378, 379, 380, 392, 417, 421, 430, 434, 460, 463, 468, 472, 606, 607, 609, 636, 653, 655, 661, 662, 664, 665, 670, 671, 674, 691, 692, 693, 709, 712, 713, 739, 741, 743, 749, 752, 754, 756, 759, 760, 761, 778, 786, 795, 802, 804, 813, 814, 817, 822, 828, 829, 832, 849, 858, 861, 862, 865, 867, 868, 879, 881, 883, 913, 914, 925, 930, 941, 942, 949, 951, 954, 989, 992, 994, 995, 1001, 1002, 1003, 1004, 1005, 1007, 1008, 1009, 1010, 1012, 1013, 1016, 1018, 1021, 1022, 1023, 1024, 1028, 1030, 1031, 1032, 1033, 1035, 1036, 1038, 1039, 1044, 1045, 1046, 1047, 1050, 1052, 1053, 1054, 1055, 1078, 1079, 1080, 1081, 1083, 1084, 1085, 1113, 1115, 1124, 1126, 1130, 1133, 1135, 1137, 1138, 1141, 1142, 1143, 1144, 1145, 1148, 1151, 1153, 1154, 1156, 1162, 1167, 1168, 1169, 1173, 1177, 1180, 1189, 1193, 1196, 1197, 1198, 1199, 1203, 1223, 1224, 1231, 1233, 1234, 1236, 1247, 1248, 1255, 1257, 1260, 1263, 1266, 1282, 1291, 1299, 1300, 1317, 1324, 1327, 1329, 1330, 1355, 1361, 1364, 1370, 1380, 1383, 1386, 1387, 1391, 1400, 1402, 1408, 1415, 1428, 1433, 1440, 1448, 1453, 1469, 1471, 1473, 1476, 1481, 1485, 1488, 1490, 1494, 1495, 1496, 1498, 1504, 1505, 1506, 1508, 1511, 1513, 1515, 1521, 1522, 1526, 1528, 1537, 1544, 1546, 1552, 1555, 1556, 1557, 1558, 1560, 1561, 1562, 1563, 1564, 1565, 1567, 1568, 1569, 1570, 1573, 1580, 1582, 1587, 1588, 1589, 1591, 1598, 1599, 1703, 1713, 1714, 1718, 1719, 1721, 1723, 1724, 1725, 1726, 1727, 1728, 1736, 1739, 1740, 1743, 1745, 1747, 1748, 1750, 1751, 1752, 1757, 1760, 1761, 1762, 1763, 1764, 1767, 1771, 1774, 1775, 1776, 1780, 1781, 1783, 1784, 1785, 1787, 1788, 1789, 1794, 1798, 1799, 1905, 1906, 1909, 1911, 1913, 1957, 1958, 1959, 1978, 1980, 1989, 1990, 1991, 1993, 1994, 1995, 1997, 1998, 2005, 2011, 2019, 2030, 3001, 3003, 3007, 3013, 3019, 3023, 3025, 3027, 3038, 3041, 3043, 3044, 3046, 3047, 3048, 3049, 3050, 3051, 3052, 3054, 3055, 3061, 3063, 3064, 3068, 3070, 3071, 3074, 3076, 3077, 3079, 3082, 3086, 3088, 3089, 3097, 3098, 3102, 3103, 3107, 3108, 3109, 3115, 3124, 3125, 3127, 3130, 3131, 3134, 3136, 3139, 3140, 3143, 3145, 3146, 3154, 3155, 3156, 3161, 3166, 3167, 3171, 3174, 3175, 3181, 3185, 3192, 3194, 3205, 3207, 3209, 3210, 3213, 3215, 3224, 3229, 3230, 3232, 3238, 3239, 3240, 3253, 3254, 3272, 3278, 3279, 3298, 3299, 3313, 3315, 3328, 3329, 3347, 3348, 3353, 3361, 3363, 3367, 3370, 3373, 3380, 3382, 3402, 3411, 3443, 3450, 3455, 3456, 3490, 3508, 3510, 3515, 3532, 3540, 3543, 3549, 3553, 3554, 3568, 3574, 3575, 3578, 3585, 3587, 3588, 3603, 3606, 3616, 3620, 3622, 3623, 3626, 3628, 3629, 3631, 3636, 3638, 3639, 3640, 3646, 3654, 3660, 3670, 3674, 3675, 3676, 3677, 3679, 3685, 3709, 3716, 3719, 3722, 3724, 3725, 3729, 3730, 3736, 3743, 3748, 3750, 3752, 3753, 3754, 3755, 3759, 3760, 3761, 3763, 3764, 3766, 3769, 3771, 3772, 3773, 3774, 3786, 3789, 3798, 3799, 3801, 3802, 3806, 3836, 3838, 3844, 3846, 3849, 3850, 3851, 3856, 3857, 3859, 3870, 3872, 3874, 3876, 3880, 3895, 3896, 3901, 3902, 3904, 3909, 3919, 3936, 3938, 3941, 3951, 3971, 3986, 3993, 3996, 4001, 4003, 4007, 4011, 4013, 4021, 4022, 4035, 4072, 4116, 4122, 4141, 4169, 4186, 4273, 97502, 97508, 97509, 97510, 97518
];

StarwoodProperties["MMGYResorts2015"] = [
  103, 127, 189, 220, 244, 374, 376, 378, 379, 468, 664, 752, 843, 914, 1001, 1008, 1018, 1028, 1050, 1080, 1087, 1090, 1092, 1095, 1098, 1162, 1169, 1187, 1199, 1298, 1361, 1369, 1376, 1377, 1378, 1381, 1386, 1391, 1406, 1497, 1498, 1507, 1522, 1523, 1558, 1562, 1599, 1719, 1734, 1747, 1905, 1906, 1958, 1961, 3170, 3328, 3382, 3544, 3730, 3786, 3805, 3851, 5607, 5608, 5611, 5646, 5648, 5657
];

StarwoodProperties["NADFlorida"] = [
  914, 1515, 321, 664, 1016, 1113, 1522, 3328, 1115, 817, 3549, 3061, 1582, 3055, 760, 1780, 1781, 1591, 1794, 1402  , 3629, 3450, 3620, 862, 1599, 1401, 5619, 1725, 1162, 1767, 3088, 3576, 5607, 5608, 468, 1018, 1317, 1142, 3213, 3046, 3040, 3626, 1505, 1564, 1764, 3748, 1021
];

StarwoodProperties["SheratonMastercard2015"] = [
  13, 15, 19, 33, 40, 48, 83, 90, 91, 92, 94, 102, 108, 111, 113, 115, 127, 139, 158, 166, 171, 177, 185, 196, 197, 198, 205, 220, 221, 238, 255, 259, 260, 270, 271, 284, 296, 303, 315, 341, 347, 350, 353, 377, 378, 379, 380, 392, 421, 430, 434, 460, 606, 609, 655, 665, 674, 691, 692, 709, 713, 739, 743, 754, 756, 759, 761, 795, 802, 804, 813, 814, 828, 843, 861, 865, 867, 868, 881, 914, 925, 941, 951, 954, 989, 992, 1021, 1047, 1124, 1133, 1138, 1143, 1144, 1152, 1162, 1177, 1195, 1233, 1238, 1247, 1266, 1282, 1291, 1298, 1317, 1324, 1327, 1391, 1398, 1400, 1428, 1450, 1469, 1494, 1495, 1496, 1497, 1506, 1523, 1536, 1546, 1556, 1557, 1564, 1582, 1589, 1703, 1719, 1725, 1726, 1727, 1728, 1733, 1751, 1774, 1783, 1784, 1959, 1991, 1995, 1998, 2011, 2019, 3012, 3023, 3054, 3068, 3079, 3089, 3107, 3125, 3134, 3175, 3205, 3207, 3438, 3455, 3456, 3490, 3508, 3639, 3660, 3675, 3676, 3679, 3709, 3716, 3725, 3748, 3771, 3783, 3806, 3847, 3894, 3951, 3986, 4011, 4013, 4021, 5601, 5604, 5607, 5608, 5611, 5624, 5657
];

StarwoodProperties["NADMexico"] = [
  259, 303, 1298, 238, 843, 3693, 1444, 3863, 1090, 1092, 1087, 5646, 3099, 3560, 3495, 1734, 1735, 1376, 1377, 1378, 1381, 1507, 3637, 3259, 3386, 3930
];

StarwoodProperties["NADResorts"] = [
  1587, 752, 1905, 1906, 3693, 843, 1719, 5611, 1298, 379, 1469, 378, 5624, 1497, 1569, 380, 1523, 1162, 127, 914, 220, 760, 5608, 5607, 377, 1391, 1781, 1558, 3544, 3382, 103, 1378, 1381, 1377, 1376, 1507, 376, 244, 1961, 1743, 1588, 1361, 189, 1734, 374, 1197, 1080, 3328, 1747, 3851, 1095, 1770, 1402, 1050, 1406, 1780, 1386, 1001, 5646, 3786, 1028, 1008, 1369, 1562, 1997, 3560, 5648, 1092, 1087, 1090, 1199, 1958, 1169, 1098, 1193, 1498, 468, 5653, 5639, 3805, 3730, 1522, 3170, 1599, 1381, 1377, 1376, 1507
];

StarwoodProperties["NADSheratonBizo"] = [
  13, 15, 19, 33, 40, 48, 83, 90, 91, 92, 94, 95, 96, 102, 111, 115, 127, 139, 151, 158, 166, 171, 177, 185, 196, 197, 198, 205, 214, 220, 221, 232, 270, 271, 315, 321, 341, 344, 347, 350, 353, 377, 378, 379, 380, 392, 417, 421, 430, 434, 460, 463, 606, 607, 609, 636, 655, 662, 664, 665, 670, 674, 691, 692, 693, 709, 713, 739, 741, 743, 754, 756, 759, 760, 761, 795, 802, 804, 813, 814, 828, 829, 832, 855, 858, 861, 865, 867, 868, 881, 883, 893, 914, 925, 941, 942, 951, 954, 989, 992, 994, 995, 3674, 3125, 1266, 3175, 3660, 1144, 3089, 1978, 3079, 1765, 1495, 1506, 5601, 1727, 1719, 1124, 2017, 3134, 1233, 1783, 1130, 3716, 3207, 1991, 1135, 3205, 5611, 3679, 2019, 1774, 1137, 1728, 1115, 1784, 1552, 1247, 1224, 1291, 1995, 3806, 1998, 3455, 3107, 3054, 1282, 1582, 1496, 3709, 1469, 1959, 1162, 1177, 1598, 3115, 1798, 3620, 1494, 1546, 1324, 1556, 3639, 5624, 1726, 1236, 3067, 1046, 1497, 3675, 1330, 1133, 3576, 1725, 1400, 1569, 1196, 5604, 1776, 1703, 1751, 1523, 3490, 3068, 1589, 1327, 3771, 1138, 1364, 3077, 3616, 5657, 3023, 1113, 1143, 1317, 1047, 2003, 1021, 3748, 1564, 1428, 3508, 3052, 3532, 3456, 5608, 5607, 2011, 1557, 1391, 3676, 1474, 468
];

StarwoodProperties["NADWestinBizo"] = [
  472, 374, 3313, 1197, 1781, 1718, 1573, 1513, 1024, 1022, 3232, 1508, 1080, 3328, 1747, 1555, 1004, 3001, 1528, 1771, 1485, 1078, 1383, 1724, 1760, 1031, 1044, 1794, 1045, 1370, 1035, 1565, 1770, 1012, 5653, 1415, 1402, 1799, 1079, 1016, 1052, 1053, 1009, 1013, 1145, 1095, 1148, 1084, 1050, 3108, 1560, 1767, 1033, 3049, 1406, 1039, 1780, 1386, 5639, 1170, 1001, 5646, 3786, 3088, 1448, 1526, 1003, 1005, 1028, 1563, 1030, 1723, 1008, 1369, 1562, 1570, 1763, 1380,3789, 1081, 1054, 1032, 1083, 1198, 1453, 1023, 1231, 3574, 1255, 1189, 1085, 1440, 5648, 1049, 1960, 1199, 1752, 1993, 5656, 1958, 1167, 1762, 1007, 1981,1169, 1055, 3730, 1002, 1038, 1010, 1098, 1248, 1193, 1505, 1764, 1498, 1750, 1997, 1568, 3156, 1036, 3103, 3027, 1761, 1173, 1018
];

StarwoodProperties["NADFocusWestin"] = [
  1402, 1380, 1009, 1050, 1084, 1528, 1030, 3851, 1080, 1053, 3328, 1095, 3049, 1004, 3789, 1958, 1054, 3786, 3730, 3805, 3798, 3760, 1033, 1001
];

StarwoodProperties["NADFocusSheraton"] = [
  127, 197, 3207, 430, 1497, 1523, 421, 3052, 1719, 1391, 220, 3951, 380, 1330, 83, 1236, 220, 3951
];

StarwoodProperties["NADFourPointsFocusNeeds2013"] = [
212, 213, 364, 653, 661, 671, 778, 786, 818, 822, 849, 856, 879, 949, 1126, 1141, 1151, 1156, 1165, 1168, 1180, 1203, 1257, 1260, 1270, 1355, 1357, 1387, 1473, 1504, 1515, 1561, 1587, 1730, 1739, 1748, 1994, 3038, 3061, 3063, 3064, 3086, 3194, 3229, 3299, 3337, 3402, 3282, 3749, 3622
];

StarwoodProperties["EMEATactical2013Q2"] = [
  3459, 89, 1852, 97, 3330, 88, 86, 71, 70, 1872, 497, 931, 43, 45, 305, 268, 3591, 412, 1435, 105, 1925, 3464, 293, 1729, 3487, 250, 1919, 125, 1900, 1899, 446, 3561, 3400, 3357, 3401, 3093, 1230, 3094, 408, 724, 1894, 1893, 3889, 3034, 1895, 1898, 1897, 1326, 3081, 1437, 201, 1863, 100, 301, 1924
];

StarwoodProperties["EMEASheratonClubTurn"] = [
  28, 53, 64, 85, 105, 116, 118, 125, 132, 137, 142, 143, 144, 145, 146, 147, 167, 201, 224, 225, 239, 268, 292, 293, 295, 298, 301, 305, 307, 310, 313, 316, 323, 326, 327, 331, 343, 363, 386, 402, 408, 409, 410, 435, 438, 442, 445, 446, 448, 466, 474, 481, 488, 497, 724, 931, 1117, 1127, 1136, 1160, 1186, 1202, 1239, 1252, 1326, 1353, 1407, 1414, 1439, 1454, 1467, 1468, 1477, 1483, 1541, 1572, 1778, 1975, 3032, 3083, 3138, 3222, 3268, 3281, 3330, 3345, 3366, 3552, 3555, 3567, 3667, 3704, 3727, 3732, 3733, 3742, 3787, 3889
];

StarwoodProperties["AdSafeMiddleEast"] = [
  "United_Arab Emirates", "Israel", "Iraq", "Kuwait", "Lebanon", "Oman", "Palestinian Territory", "Qatar", "Saudi Arabia", "Syrian", "Arab Republic Yemen"
];

StarwoodProperties["AdSafeScandanavia"] = [
  "Denmark", "Finland", "Iceland", "Norway", "Sweden"
];

StarwoodProperties["EMEAAbuDhabi"] = [
  446, 1899, 1900, 3357, 3400, 3401, 3561
];

StarwoodProperties["EMEADubai"] = [
  408, 724, 1230, 1326, 1893, 1894, 1895, 1897, 1898, 3034, 3081, 3093, 3094, 3889
];

StarwoodProperties["EMEAGreece"] = [
  101, 1194, 1288, 1487, 1983, 1984, 1985, 3022, 3289, 3290, 3555
];

StarwoodProperties["LondonMastercard2015"] = [
  3464, 412, 1925, 105
];

StarwoodProperties["ParisMastercard2015"] = [
  250, 3487, 125, 1729
];

StarwoodProperties["RussiaMastercard2015"] = [
  4130, 1864, 3733, 3270 
];

StarwoodProperties["ItalyMastercard2015"] = [
    4231, 43, 45, 1397
];

StarwoodProperties["RomeMastercard2015"] = [
    70, 497, 931, 71
];

StarwoodProperties["IstanbulMastercard2015"] = [
    3618, 3028, 3281, 4032
];

StarwoodProperties["EMEAFlorence"] = [
  43, 45, 305, 49, 53, 3138, 4107, 239
];

StarwoodProperties["EMEALondon"] = [
  105, 412, 930, 1435, 1925, 3464, 3591
];

StarwoodProperties["EMEARome"] = [
  70, 71, 497, 931, 1872
];

StarwoodProperties["EMEAMajorca"] = [
  79, 85, 86, 88, 116, 1403, 1467, 1468, 1539, 1541, 1722, 1931, 3037, 3090, 3183, 
3692, 3787
];

StarwoodProperties["EMEAMiddleEast"] = [
  "United_Arab Emirates", "Israel", "Iraq", "Kuwait", "Lebanon", "Oman", "Palestinian Territory", "Qatar", "Saudi Arabia", "Syrian", "Arab Republic Yemen", "Jordan"
];

StarwoodProperties["NADSummer 2013 B2C"] = [
  3370, 3124, 849, 463, 3041, 3895, 3863, 3259, 1913, 3313, 303, 3693, 430, 843, 1719, 271, 196, 3134, 40, 3207, 1991, 3205, 1298, 1177, 1598, 259, 421, 1497, 3012, 1703, 1523, 127, 220, 91, 238, 3052, 1391, 3171, 1735, 1734, 244, 1961, 1361, 3544, 3677, 3646, 103, 81, 97510, 1488, 3328, 1004, 1528, 1095, 1031, 1035, 1770, 1402, 1052, 1009, 1084, 3049, 1386, 1001, 1526, 1030, 1008, 1380, 3789, 1032, 1085, 1960, 3730, 1098, 1193, 1787, 97509, 1521, 1522, 1785, 1789, 2005, 1444, 1471, 97502, 3154, 1234, 1299, 3170, 1433, 1736, 1599, 97518, 1092, 1012, 3560, 3495, 5646, 3786, 1087, 3574, 3386, 1090, 1958, 1762, 3099
];

StarwoodProperties["LBI Targets"] = [
  "GB", "AE", "ES", "NO", "IT", "DE", "FR", "BE", "IS", "NL", "LU", "SE", "DK", "FI"
];

StarwoodProperties["NAD: Caribbean Cluster"] = [
1092, 1095, 1098, 1497, 1523, 1548, 1770, 1960, 1961, 3067, 3170, 3684, 3805, 5646
];

StarwoodProperties["NAD: Hot Escapes 2013"] = [
13, 15, 48, 90, 102, 111, 123, 127, 151, 166, 171, 189, 193, 220, 221, 232, 270, 271, 347, 350, 463, 606, 609, 655, 664, 692, 709, 752, 756, 778, 814, 849, 865, 867, 930, 941, 954, 992, 1003, 1008, 1009, 1016, 1021, 1022, 1033, 1036, 1038, 1047, 1078, 1079, 1080, 1081, 1084, 1085, 1098, 1115, 1130, 1135, 1137, 1143, 1144, 1148, 1169, 1170, 1173, 1199, 1234, 1260, 1263, 1291, 1291, 1299, 1324, 1327, 1361, 1364, 1370, 1402, 1433, 1440, 1471, 1488, 1494, 1495, 1498, 1505, 1508, 1513, 1556, 1561, 1562, 1565, 1587, 1588, 1718, 1736, 1747, 1750, 1758, 1760, 1762, 1764, 1771, 1776, 1787, 1788, 1799, 1958, 1960, 1961, 1993, 2005, 3003, 3013, 3047, 3048, 3049, 3050, 3054, 3055, 3061, 3124, 3139, 3140, 3156, 3167, 3170, 3171, 3181, 3205, 3207, 3254, 3328, 3337, 3347, 3348, 3402, 3443, 3456, 3549, 3553, 3576, 3578, 3629, 3636, 3675, 3677, 3743, 3748, 3749, 3766, 3786, 3789, 3801, 3806, 3851, 3856, 3938, 97502, 97509
];

StarwoodProperties["NAD 2013 B2C WEST INCREMENTAL"] = [
 103, 127, 220, 244, 1001, 1008, 1009, 1012, 1361, 1386, 1391, 1433, 1488, 1703, 1719, 1736, 1762, 1958, 3205, 3544, 3574, 3730, 3786
];


StarwoodProperties["EAME Sojern Porperties"] = [
  409, 3080, 3057, 305, 45, 43, 1856, 363, 142, 141, 143, 1397, 53, 49, 3137, 156, 148, 1860, 145, 146, 274, 72, 73, 75, 89, 97, 1852 
];

StarwoodProperties["NARequest ALL Resorts 2014"] = [
  1587, 752, 1905, 1906, 3693, 843, 1719, 5611, 1298, 379, 1469, 378, 5624, 1497, 1569, 380, 1523, 1162, 127, 914, 220, 760, 5608, 5607, 377, 1391, 1781, 1558, 3544, 3382, 103, 1378, 1381, 1377, 1376, 1507, 376, 244, 1961, 1743, 1588, 1361, 189, 1734, 374, 1197, 1080, 3328, 1747, 3851, 1095, 1770, 1402, 1050, 1406, 1780, 1386, 1001, 5646, 3786, 1028, 1008, 1369, 1562, 1997, 3560, 5648, 1092, 1087, 1090, 1199, 1958, 1169, 1098, 1193, 1498, 468, 5653, 5639, 3805, 3730, 1522, 3170, 1599, 4273
];

StarwoodProperties["APACCustomerBilling"] = [
  "AF", "AM", "AZ", "BH", "BD", "BT", "BN", "KH", "CN", "CX", "CC", "IO", "GE", "HK", "IN", "ID", "IR", "IL", "IQ", "JP", "JO", "KZ", "KP", "KR", "KW", "KG", "LA", "LB", "MO", "MY", "MV", "MN", "MM", "NP", "OM", "PK", "PH", "QA", "SA", "SG", "LK", "SY", "TW", "TJ", "TH", "TR", "TM", "AE", "UZ", "VN", "YE", "PS"
 ];
 
 StarwoodProperties["NADFMTexasProps"] = [
    1052, 1053, 1054, 1143, 1167, 1170, 1193, 1291, 1420, 1481, 1521, 1565, 1784, 1991, 247, 3023, 3041, 3079, 3097, 3098, 3107, 3108, 3109, 3127, 3130, 3146, 3155, 3175, 3207, 3215, 3224, 3232, 3240, 3282, 3321, 3337, 3348, 341, 3515, 3578, 3585, 3603, 3799, 3895, 472, 743, 861, 909, 96
 ];
  
  StarwoodProperties["FieldMarketingWest"] = [
   1736, 1448, 3786, 102, 954, 177, 3587, 3801, 3574, 3102, 3174, 3064, 1703, 1001, 1386, 1391, 103, 3145, 1008, 4007
 ];

/*Last update May 2015*/
    StarwoodProperties["FieldMarketingNorthRegion"] = [
  15, 33, 40, 81, 90, 91, 92, 94, 123, 158, 166, 185, 193, 196, 197, 205, 208, 212, 221, 232, 232, 245, 270, 271, 347, 392, 421, 430, 463, 606, 607, 636, 655, 661, 665, 674, 691, 692, 693, 741, 749, 756, 759, 761, 786, 802, 813, 828, 832, 849, 865, 867, 868, 930, 949, 951, 989, 992, 994, 1013, 1030, 1031, 1032, 1033, 1035, 1036, 1038, 1044, 1045, 1047, 1081, 1083, 1084, 1085, 1126, 1130, 1141, 1145, 1151, 1177, 1197, 1234, 1263, 1266, 1282, 1299, 1324, 1329, 1355, 1370, 1380, 1387, 1408, 1415, 1428, 1440, 1471, 1473, 1476, 1490, 1495, 1496, 1498, 1504, 1508, 1513, 1526, 1528, 1537, 1546, 1557, 1570, 1573, 1587, 1589, 1713, 1718, 1721, 1724, 1727, 1728, 1748, 1750, 1752, 1760, 1761, 1771, 1774, 1775, 1776, 1785, 1787, 1799, 1913, 1980, 1995, 2005, 2011, 2019, 3001, 3003, 3019, 3025, 3027, 3044, 3049, 3050, 3051, 3052, 3054, 3074, 3077, 3082, 3103, 3115, 3124, 3134, 3154, 3181, 3192, 3194, 3209, 3210, 3230, 3239, 3254, 3278, 3279, 3313, 3315, 3329, 3347, 3353, 3361, 3367, 3370, 3380, 3382, 3443, 3455, 3508, 3532, 3543, 3554, 3568, 3575, 3588, 3606, 3616, 3636, 3639, 3642, 3646, 3647, 3654, 3675, 3676, 3677, 3679, 3716, 3725, 3752, 3754, 3759, 3760, 3771, 3773, 3789, 3798, 3806, 3838, 3844, 3856, 3870, 3872, 3874, 3880, 3901, 3919, 3936, 3938, 3961, 4011, 4013, 4058, 97502, 97509, 97510
  
   ];
    StarwoodProperties["FieldMarketingCalifornia"] = [
    3753, 3071, 3719, 1300, 822, 1156, 1223, 1257, 1739, 712, 1580, 671, 3755, 913, 3763, 3510, 1260, 752, 373, 3674, 995, 1719, 417, 1135, 662, 315, 1552, 344, 1247, 1959, 1598, 1556, 1133, 1569, 1196, 1751, 127, 670, 1138, 2003, 754, 83, 3171, 1361, 1511, 1488, 1004, 1009, 1003, 1005, 1008, 1562, 3902, 1762, 1007, 1981, 1002, 1010, 1997, 1789, 97518, 1433, 1153

 ];
 
 StarwoodProperties["LADSheratonPropsBeta"] = [
    108, 113, 238, 255, 259, 260, 284, 296, 303, 651, 766, 843, 1152, 1159, 1195, 1238, 1286, 1298, 1398, 1450, 1534, 1536, 1597, 1701, 1733, 3012, 3438, 3681, 3693, 3783, 3847, 3894, 3968

 ];
 
  StarwoodProperties["MediaDeskTestLAD"] = [
     3600, 3630, 3837, 3897, 3930, 736, 1294, 1385, 1441, 1535, 1554, 1576, 1769, 3228, 3505, 3738, 3762, 3987, 206, 233, 1376, 1377, 1378, 1381, 1507, 3285, 3287, 3513, 3614, 3259, 3863, 108, 113, 238, 255, 259, 260, 284, 296, 303, 651, 766, 843, 1152, 1159, 1195, 1238, 1286, 1298, 1398, 1450, 1534, 1536, 1597, 1701, 1733, 3012, 3438, 3681, 3693, 3783, 3847, 3894, 3968, 1734, 1735, 1444, 1979, 3718, 1075, 1087, 1090, 1092, 1094, 3099, 3286, 3386, 3495, 3560, 3610, 5646

 ];
   StarwoodProperties["DCHotelsFM"] = [
     33, 90, 193, 197, 245, 655, 691, 741, 1013, 1130, 1266, 1495, 1508, 1513, 1573, 1589, 1718, 1750, 1752, 1761, 1998, 2011, 3027, 3047, 3050, 3051, 3103, 3140, 3279, 3771

 ];
 
    StarwoodProperties["SOUTHSUMMERFM2015"] = [
     13, 48, 95, 96, 111, 115, 171, 247, 321, 341, 353, 434, 468, 472, 743, 760, 814, 817, 832, 861, 862, 914, 942, 1016, 1018, 1021, 1022, 1023, 1024, 1039, 1046, 1050, 1052, 1053, 1054, 1095, 1098, 1113, 1124, 1143, 1144, 1162, 1167, 1169, 1187, 1193, 1224, 1233, 1236, 1255, 1291, 1317, 1383, 1400, 1481, 1485, 1494, 1497, 1505, 1515, 1521, 1522, 1523, 1548, 1558, 1560, 1563, 1564, 1565, 1568, 1582, 1591, 1599, 1714, 1725, 1726, 1763, 1764, 1767, 1770, 1780, 1781, 1784, 1788, 1794, 1798, 1961, 1978, 1989, 1993, 2030, 3003, 3007, 3023, 3038, 3046, 3055, 3061, 3063, 3068, 3070, 3076, 3088, 3089, 3097, 3098, 3107, 3108, 3109, 3130, 3131, 3136, 3143, 3146, 3155, 3167, 3170, 3175, 3207, 3213, 3215, 3224, 3229, 3232, 3240, 3272, 3298, 3299, 3302, 3328, 3348, 3363, 3373, 3402, 3411, 3450, 3515, 3549, 3553, 3578, 3585, 3603, 3620, 3622, 3623, 3626, 3629, 3640, 3684, 3709, 3722, 3736, 3743, 3748, 3750, 3761, 3764, 3766, 3772, 3799, 3802, 3805, 3846, 3849, 3850, 3851, 3855, 3856, 3875, 3876, 3896, 3899, 3904, 3909, 3941, 3951, 3986, 3992, 4001, 4021, 4022, 5607, 5608, 97508

 ];
 
 StarwoodProperties["FMCADProperties2015"] = [
     3628, 3044, 3380, 3867, 4017, 3670, 3759, 4241, 1740, 3278, 3013, 3836, 1544, 4018, 3838, 1387, 1329, 304, 1203, 3724, 749, 1775, 930, 1748, 4058, 3315, 1994, 1587, 3615, 3185, 1355, 3898, 1490, 1473, 213, 1561, 3880, 1180, 3086, 463, 1913, 3313, 1197, 925, 739, 271, 692, 185, 3455, 3639, 665, 221, 3490, 941, 3508, 3456, 609, 709, 1080, 1747, 1771, 1078, 4296, 1079, 1148, 1084, 1081, 1083, 1085, 1199, 1498, 3156, 1471

 ];
 
 StarwoodProperties["GreaterNorthFM"] = [
     15, 33, 40, 81, 90, 91, 92, 94, 123, 158, 166, 185, 193, 196, 197, 205, 208, 212, 221, 232, 232, 245, 270, 271, 347, 392, 421, 430, 463, 606, 607, 636, 655, 661, 665, 674, 691, 692, 693, 741, 749, 756, 759, 761, 786, 802, 813, 828, 832, 849, 865, 867, 868, 930, 949, 951, 989, 992, 994, 1013, 1030, 1031, 1032, 1033, 1035, 1036, 1038, 1044, 1045, 1047, 1081, 1083, 1084, 1085, 1126, 1130, 1141, 1145, 1151, 1177, 1197, 1234, 1263, 1266, 1282, 1299, 1324, 1329, 1355, 1370, 1380, 1387, 1408, 1415, 1428, 1440, 1471, 1473, 1476, 1490, 1495, 1496, 1498, 1504, 1508, 1513, 1526, 1528, 1537, 1546, 1557, 1570, 1573, 1587, 1589, 1713, 1718, 1721, 1724, 1727, 1728, 1748, 1750, 1752, 1760, 1761, 1771, 1774, 1775, 1776, 1785, 1787, 1799, 1913, 1980, 1995, 2005, 2011, 2019, 3001, 3003, 3019, 3025, 3027, 3044, 3049, 3050, 3051, 3052, 3054, 3074, 3077, 3082, 3103, 3115, 3124, 3134, 3154, 3181, 3192, 3194, 3209, 3210, 3230, 3239, 3254, 3278, 3279, 3313, 3315, 3329, 3347, 3353, 3361, 3367, 3370, 3380, 3382, 3443, 3455, 3508, 3532, 3543, 3554, 3568, 3575, 3588, 3606, 3616, 3636, 3639, 3642, 3646, 3647, 3654, 3675, 3676, 3677, 3679, 3716, 3725, 3752, 3754, 3759, 3760, 3771, 3773, 3789, 3798, 3806, 3838, 3844, 3856, 3870, 3872, 3874, 3880, 3901, 3919, 3936, 3938, 3961, 4011, 4013, 4058, 97502, 97509, 97510 

 ];
 
 
/*
 **************************************************************************************************************
 * Supporting library code - DO NOT EDIT ANYTHING BELOW THIS LINE
 **************************************************************************************************************
 */

window.BtStarwood = {};

BtStarwood.propertyMatch = function (regionName, id) {
  var list = StarwoodProperties[regionName];
  if (!BrightTag.Types.isArray(list)) { return false; }
  return new RegExp("\\b" + id + "\\b").test(list.join());
};
