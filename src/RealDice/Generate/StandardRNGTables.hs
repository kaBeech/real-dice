module RealDice.Generate.StandardRNGTables
  ( standardTableBoolPrimeLength,
    standardTableBoolFullLength,
    standardTableIntPrimeLength,
    standardTableIntFullLength,
    rdBinPrime,
    rdBinFull,
  )
where

standardTableIntPrimeLength :: [Int]
standardTableIntPrimeLength = [1005,942,501,178,15,464,678,683,723,636,454,809,359,737,466,1050,1040,167,294,306,594,368,876,611,30,299,575,1019,747,868,189,140,505,542,73,531,421,101,940,318,128,632,914,342,295,174,230,446,1047,633,489,397,1007,431,536,1038,909,162,113,863,885,1015,85,1049,820,366,520,588,778,201,889,1045,449,1048,474,1010,262,123,65,995,947,298,50,440,335,427,997,389,12,396,168,577,468,278,1017,91,291,913,959,407,110,493,365,908,674,209,159,865,150,268,554,754,966,513,692,5,606,668,76,886,139,425,685,133,576,535,755,124,749,231,118,989,1026,460,894,432,528,348,163,456,834,981,242,223,418,212,185,578,332,154,999,404,638,973,47,243,445,62,836,805,322,630,771,97,1039,255,880,400,938,371,899,86,680,475,72,713,126,182,584,888,839,600,296,645,388,507,499,52,590,307,845,893,855,866,494,211,273,895,757,180,420,195,38,393,745,597,317,780,816,443,204,970,229,137,814,458,582,485,690,726,537,937,87,910,132,164,59,984,627,36,818,949,352,377,252,589,1009,33,254,552,878,796,793,932,476,572,53,558,919,952,896,543,166,114,549,817,546,287,484,220,16,1036,487,402,595,706,81,933,562,496,1028,751,873,280,127,337,583,99,88,419,7,659,175,351,738,313,21,143,807,769,312,353,1008,524,760,955,848,343,806,946,256,514,9,614,145,775,115,288,826,856,693,277,906,74,664,184,403,347,744,790,129,841,152,842,436,882,361,247,43,624,157,944,270,598,197,871,539,883,631,993,357,835,1044,131,710,911,637,927,884,398,777,210,616,563,1043,890,173,253,285,729,625,1022,235,517,833,45,679,1011,951,239,763,467,623,859,236,976,573,907,4,444,171,917,330,996,626,69,681,188,874,725,711,628,13,6,176,381,301,66,920,316,587,376,502,1051,356,258,728,491,530,696,931,26,750,96,350,339,622,527,1023,695,27,646,32,401,714,187,822,391,550,785,42,553,830,991,953,461,663,580,1035,331,227,1033,559,233,985,746,363,336,596,533,987,521,712,486,472,248,105,581,698,490,215,1006,853,699,1018,915,272,811,146,756,892,44,651,727,8,226,406,877,762,843,900,823,827,426,813,741,612,534,869,969,261,37,441,208,860,116,838,408,979,926,794,293,214,263,364,1014,333,998,71,260,832,346,1,954,879,372,326,672,302,217,165,586,412,119,912,434,206,717,259,423,161,797,228,70,28,269,360,370,675,599,338,24,945,488,847,11,481,245,39,308,828,734,819,249,846,697,375,112,191,629,724,700,650,510,765,684,311,731,153,190,862,821,22,320,1046,963,279,442,186,103,78,829,851,971,1001,380,516,144,225,84,17,781,901,548,82,557,179,429,703,640,503,644,355,721,613,1002,673,202,271,478,566,1024,831,916,918,593,1042,399,974,770,309,988,207,482,304,666,3,315,662,394,1034,887,939,61,592,522,56,382,282,983,177,433,701,736,341,303,383,438,656,497,707,328,608,935,354,881,29,424,716,964,875,962,634,671,768,515,978,786,104,825,647,435,455,169,234,560,773,619,733,547,415,511,660,943,329,314,387,283,1032,643,319,739,68,610,585,459,147,1012,267,238,334,657,609,237,512,1031,718,579,151,709,783,473,635,852,968,111,170,569,854,483,193,840,591,975,571,803,615,936,451,158,574,798,509,958,705,704,120,759,956,508,181,772,720,275,972,106,950,1000,715,702,774,95,19,373,286,160,730,1030,142,284,448,977,665,289,653,965,670,529,688,658,764,300,246,55,801,722,367,452,102,89,1013,687,395,49,392,824,203,948,837,405,200,903,849,655,135,924,570,67,136,682,462,743,990,812,109,379,345,417,265,799,410,25,369,450,1027,409,1016,358,141,374,735,804,898,51,94,602,384,46,864,930,604,340,649,541,155,789,2,224,802,779,292,266,469,305,934,719,107,960,1037,244,905,344,447,324,257,538,654,14,240,791,504,386,1025,413,149,601,1041,480,545,221,125,362,523,31,194,922,198,957,218,858,327,251,416,422,41,130,961,676,603,439,815,621,800,219,199,57,75,117,241,411,568,708,63,904,264,232,121,325,897,967,276,134,808,321,205,222,506,138,83,857,216,992,457,453,761,752,787,617,122,766,694,792,477,156,492,844,689,850,923,40,788,1003,290,532,79,64,196,740,941,810,18,390,92,323,500,1020,430,691,108,437,929,620,213,34,556,1029,607,349,661,525,652,677,172,414,183,428,561,565,23,555,605,463,753,782,982,642,648,994,465,274,861,748,758,310,891,93,526,784,281,767,20,986,686,250,60,297,928,495,742,921,77,867,925,378,54,470,90,471,902,10,518,98,639,540,498,519,667,385,980,872,1021,567,669,776,870,618,544,192,80,551,35,564,1004,48,100,148,641,58,795,479,732]

standardTableIntFullLength :: [Int]
standardTableIntFullLength = [732,1005,501,178,479,15,464,58,683,723,454,148,100,359,564,551,544,1040,669,306,1021,594,876,611,872,30,980,385,747,868,189,140,505,540,639,73,531,101,902,940,128,632,914,342,295,174,230,446,1047,633,489,471,90,54,431,536,925,909,162,863,885,77,1015,1049,820,921,366,588,742,778,201,297,60,449,250,474,686,262,123,20,767,298,281,50,335,427,784,526,389,12,758,465,994,648,1017,91,291,913,959,642,982,493,782,753,908,605,1053,555,23,565,428,554,754,966,183,692,5,606,668,172,677,661,349,607,1029,556,576,535,755,124,749,231,118,989,1026,460,894,432,528,348,163,456,834,981,242,223,418,212,185,578,332,154,999,404,638,973,47,243,445,62,836,805,322,630,771,97,1039,255,880,400,938,371,899,86,680,475,72,713,126,182,584,888,839,600,296,645,388,507,499,52,590,307,845,893,855,866,494,211,273,895,757,180,420,195,38,393,745,597,317,780,816,443,204,970,229,137,814,458,582,485,690,726,537,937,87,910,132,164,59,984,627,36,818,949,352,377,252,589,1009,33,254,552,878,796,793,932,476,572,53,558,919,952,896,543,166,114,549,817,546,287,484,220,16,1036,487,402,595,706,81,933,562,496,1028,751,873,280,127,337,583,99,88,419,7,659,175,351,738,313,21,143,807,769,312,353,1008,524,760,955,848,343,806,946,256,514,9,614,145,775,115,288,826,856,693,277,906,74,664,184,403,347,744,790,129,841,152,842,436,882,361,247,43,624,157,944,270,598,197,871,539,883,631,993,357,835,1044,131,710,911,637,927,884,398,777,210,616,563,1043,890,173,253,285,729,625,1022,235,517,833,45,679,1011,951,239,763,467,623,859,236,976,573,907,4,444,171,917,330,996,626,69,681,188,874,725,711,628,13,6,176,381,301,66,920,316,587,376,502,1051,356,258,728,491,530,696,931,26,750,96,350,339,622,527,1023,695,27,646,32,401,714,187,822,391,550,785,42,553,830,991,953,461,663,580,1035,331,227,1033,559,233,985,746,363,336,596,533,987,521,712,486,472,248,105,581,698,490,215,1006,853,699,1018,915,272,811,146,756,892,44,651,727,8,226,406,877,762,843,900,823,827,426,813,741,612,534,869,969,261,37,441,208,860,116,838,408,979,926,794,293,214,263,364,1014,333,998,71,260,832,346,1,954,879,372,326,672,302,217,165,586,412,119,912,434,206,717,259,423,161,797,228,70,28,269,360,370,675,599,338,24,945,488,847,11,481,245,39,308,828,734,819,249,846,697,375,112,191,629,724,700,650,510,765,684,311,731,153,190,862,821,22,320,1046,963,279,442,186,103,78,829,851,971,1001,380,516,144,225,84,17,781,901,548,82,557,179,429,703,640,503,644,355,721,613,1002,673,202,271,478,566,1024,831,916,918,593,1042,399,974,770,309,988,207,482,304,666,3,315,662,394,1034,887,939,61,592,522,56,382,282,983,177,433,701,736,341,303,383,438,656,497,707,328,608,935,354,881,29,424,716,964,875,962,634,671,768,515,978,786,104,825,647,435,455,169,234,560,773,619,733,547,415,511,660,943,329,314,387,283,1032,643,319,739,68,610,585,459,147,1012,267,238,334,657,609,237,512,1031,718,579,151,709,783,473,635,852,968,111,170,569,854,483,193,840,591,975,571,803,615,936,451,158,574,798,509,958,705,704,120,759,956,508,181,772,720,275,972,106,950,1000,715,702,774,95,19,373,286,160,730,1030,142,284,448,977,665,289,653,965,670,529,688,658,764,300,246,55,801,722,367,452,102,89,1013,687,395,49,392,824,203,948,837,405,200,903,849,655,135,924,570,67,136,682,462,743,990,812,109,379,345,417,265,799,410,25,369,450,1027,409,1016,358,141,374,735,804,898,51,94,602,384,46,864,930,604,340,649,541,155,789,2,224,802,779,292,266,469,305,934,719,107,960,1037,244,905,344,447,324,257,538,654,14,240,791,504,386,1025,413,149,601,1041,480,545,221,125,362,523,31,194,922,198,957,218,858,327,251,416,422,41,130,961,676,603,439,815,621,800,219,199,57,75,117,241,411,568,708,63,904,264,232,121,325,897,967,276,134,808,321,205,222,506,138,83,857,216,992,457,453,761,752,787,617,122,766,694,792,477,156,492,844,689,850,923,40,788,1003,290,532,79,64,196,740,941,810,18,390,92,323,500,1020,430,691,108,437,929,620,213,34,1052,133,685,425,139,886,525,652,76,513,414,268,150,561,865,159,209,674,463,365,110,407,278,468,577,168,274,396,861,748,310,891,93,997,440,947,995,65,986,1010,1048,1045,889,928,495,520,85,113,867,1038,378,1007,397,470,318,421,10,518,542,98,1019,575,498,519,667,299,368,294,167,567,776,870,1050,618,192,466,80,35,737,1004,48,809,636,641,678,795,942]

standardTableBoolPrimeLength :: [Bool]
standardTableBoolPrimeLength = [True,False,True,False,True,False,False,True,True,False,False,True,True,True,False,False,False,True,False,False,False,False,False,True,False,True,True,True,True,False,True,False,True,False,True,True,True,True,False,False,False,False,False,False,True,False,False,False,True,True,True,True,True,True,False,False,True,False,True,True,True,True,True,True,False,False,False,False,False,True,True,True,True,False,False,False,False,True,True,True,True,False,False,False,True,True,True,True,False,False,False,True,False,False,True,True,True,True,True,True,False,True,True,False,False,True,True,True,False,False,False,False,False,True,False,True,False,False,False,False,True,True,True,True,False,True,True,False,True,True,False,True,False,False,False,False,False,False,True,False,False,True,False,True,False,False,True,False,False,False,True,False,False,True,True,True,True,False,False,True,False,False,True,True,True,True,False,False,False,True,True,False,False,True,False,True,False,False,False,False,True,False,False,True,False,True,True,False,False,True,True,True,True,False,False,True,True,True,True,False,False,True,False,True,True,True,True,False,False,True,False,False,True,True,False,False,False,True,False,False,True,True,True,False,False,False,True,False,True,False,False,True,False,True,False,True,True,True,False,False,False,False,True,False,False,False,True,False,True,False,False,True,False,False,True,True,False,True,False,False,False,False,True,False,True,False,True,True,False,False,False,True,True,False,True,True,True,True,False,True,True,True,True,True,False,True,True,True,True,True,False,True,False,False,False,True,False,True,False,False,False,False,True,False,True,True,True,False,False,False,True,True,False,False,False,False,True,True,False,False,True,True,False,False,False,False,True,True,True,False,True,False,False,False,True,True,True,True,True,True,True,True,False,True,False,True,True,True,False,False,True,False,False,True,True,False,True,True,True,True,True,False,True,True,True,True,True,True,True,True,True,True,True,True,False,False,True,True,False,False,True,True,False,False,False,True,True,False,False,True,True,False,True,False,False,True,True,False,False,False,True,False,False,True,False,False,False,True,False,False,True,False,False,False,False,True,False,True,True,True,True,False,False,True,False,True,False,True,False,True,False,True,False,True,True,True,True,False,True,True,True,True,True,True,True,False,True,False,False,True,True,True,False,False,False,False,True,True,False,False,True,False,True,True,False,True,False,True,False,False,False,False,True,True,False,False,False,True,False,True,False,True,True,False,True,True,False,False,True,True,True,True,True,False,False,False,False,False,True,False,False,True,False,True,False,False,True,False,True,False,False,False,True,False,True,False,False,False,False,True,True,False,False,True,False,False,False,True,True,True,True,True,False,False,False,True,False,False,True,True,False,False,True,False,True,True,True,True,True,False,False,False,True,True,False,True,True,False,True,True,False,False,False,False,True,False,True,True,True,False,False,True,False,False,False,True,True,False,False,True,False,True,True,True,True,False,False,False,True,False,True,True,True,False,False,True,True,True,True,False,True,False,True,True,True,False,True,False,True,False,False,False,True,False,False,True,False,True,False,False,True,False,True,False,False,False,True,True,False,False,False,True,True,True,False,False,False,False,False,True,True,True,True,False,True,True,True,False,False,True,True,False,False,True,False,True,True,False,False,False,True,False,False,True,False,True,False,False,False,True,True,True,True,True,False,False,True,True,True,True,True,True,False,True,True,False,True,True,False,True,True,True,False,False,True,True,True,False,True,False,False,True,True,True,False,True,False,True,True,True,True,True,True,False,False,True,False,True,False,True,True,False,True,True,True,True,True,False,True,False,False,False,True,False,True,False,False,True,False,False,True,False,False,True,False,False,False,False,True,False,False,True,True,True,False,False,False,False,False,False,False,True,True,True,True,True,False,True,False,False,False,False,False,True,True,False,True,False,False,True,True,True,True,True,False,False,True,False,True,True,False,True,True,True,True,False,False,True,False,False,False,True,False,False,True,True,True,True,True,True,False,True,True,False,True,True,False,False,True,False,True,False,False,True,False,False,False,False,False,False,False,False,True,True,True,True,False,False,False,True,False,False,True,True,False,True,True,False,True,False,True,False,True,False,True,False,False,False,False,True,False,False,True,True,True,True,True,False,True,True,True,False,True,True,False,False,False,True,False,False,True,True,False,False,True,False,True,False,True,True,True,True,False,True,True,True,True,True,True,True,False,False,True,False,False,False,True,True,True,True,False,False,False,True,True,False,False,False,True,True,False,False,True,True,True,False,True,True,False,False,False,False,True,False,False,False,True,False,True,False,False,True,False,False,True,False,False,False,True,False,False,False,False,True,False,False,False,True,False,True,True,False,True,False,False,True,True,True,True,True,False,True,False,False,True,False,True,True,True,True,True,True,True,False,False,False,False,False,True,False,True,False,False,False,True,True,False,False,True,True,False,False,False,False,False,True,False,True,False,True,True,True,True,False,False,False,False,True,False,False,False,False,True,False,False,True,True,True,False,False,True,True,True,False,False,False,False,False,False,True,True,False,False,False,False,False,True,False,True,True,False]

standardTableBoolFullLength :: [Bool]
standardTableBoolFullLength = [False,True,True,False,True,True,False,False,True,True,False,False,False,True,False,True,False,False,True,False,True,False,False,True,False,False,False,True,True,False,True,False,True,False,True,True,True,True,False,False,False,False,False,False,True,False,False,False,True,True,True,True,False,False,True,False,True,True,False,True,True,True,True,True,False,True,False,False,False,False,True,True,False,True,False,False,False,False,True,False,True,False,True,False,True,True,False,False,True,False,False,True,False,False,True,True,True,True,True,False,False,True,False,True,False,True,True,True,True,True,False,False,False,False,True,False,True,False,False,False,True,True,True,True,True,False,False,True,True,False,True,True,False,True,False,False,False,False,False,False,True,False,False,True,False,True,False,False,True,False,False,False,True,False,False,True,True,True,True,False,False,True,False,False,True,True,True,True,False,False,False,True,True,False,False,True,False,True,False,False,False,False,True,False,False,True,False,True,True,False,False,True,True,True,True,False,False,True,True,True,True,False,False,True,False,True,True,True,True,False,False,True,False,False,True,True,False,False,False,True,False,False,True,True,True,False,False,False,True,False,True,False,False,True,False,True,False,True,True,True,False,False,False,False,True,False,False,False,True,False,True,False,False,True,False,False,True,True,False,True,False,False,False,False,True,False,True,False,True,True,False,False,False,True,True,False,True,True,True,True,False,True,True,True,True,True,False,True,True,True,True,True,False,True,False,False,False,True,False,True,False,False,False,False,True,False,True,True,True,False,False,False,True,True,False,False,False,False,True,True,False,False,True,True,False,False,False,False,True,True,True,False,True,False,False,False,True,True,True,True,True,True,True,True,False,True,False,True,True,True,False,False,True,False,False,True,True,False,True,True,True,True,True,False,True,True,True,True,True,True,True,True,True,True,True,True,False,False,True,True,False,False,True,True,False,False,False,True,True,False,False,True,True,False,True,False,False,True,True,False,False,False,True,False,False,True,False,False,False,True,False,False,True,False,False,False,False,True,False,True,True,True,True,False,False,True,False,True,False,True,False,True,False,True,False,True,True,True,True,False,True,True,True,True,True,True,True,False,True,False,False,True,True,True,False,False,False,False,True,True,False,False,True,False,True,True,False,True,False,True,False,False,False,False,True,True,False,False,False,True,False,True,False,True,True,False,True,True,False,False,True,True,True,True,True,False,False,False,False,False,True,False,False,True,False,True,False,False,True,False,True,False,False,False,True,False,True,False,False,False,False,True,True,False,False,True,False,False,False,True,True,True,True,True,False,False,False,True,False,False,True,True,False,False,True,False,True,True,True,True,True,False,False,False,True,True,False,True,True,False,True,True,False,False,False,False,True,False,True,True,True,False,False,True,False,False,False,True,True,False,False,True,False,True,True,True,True,False,False,False,True,False,True,True,True,False,False,True,True,True,True,False,True,False,True,True,True,False,True,False,True,False,False,False,True,False,False,True,False,True,False,False,True,False,True,False,False,False,True,True,False,False,False,True,True,True,False,False,False,False,False,True,True,True,True,False,True,True,True,False,False,True,True,False,False,True,False,True,True,False,False,False,True,False,False,True,False,True,False,False,False,True,True,True,True,True,False,False,True,True,True,True,True,True,False,True,True,False,True,True,False,True,True,True,False,False,True,True,True,False,True,False,False,True,True,True,False,True,False,True,True,True,True,True,True,False,False,True,False,True,False,True,True,False,True,True,True,True,True,False,True,False,False,False,True,False,True,False,False,True,False,False,True,False,False,True,False,False,False,False,True,False,False,True,True,True,False,False,False,False,False,False,False,True,True,True,True,True,False,True,False,False,False,False,False,True,True,False,True,False,False,True,True,True,True,True,False,False,True,False,True,True,False,True,True,True,True,False,False,True,False,False,False,True,False,False,True,True,True,True,True,True,False,True,True,False,True,True,False,False,True,False,True,False,False,True,False,False,False,False,False,False,False,False,True,True,True,True,False,False,False,True,False,False,True,True,False,True,True,False,True,False,True,False,True,False,True,False,False,False,False,True,False,False,True,True,True,True,True,False,True,True,True,False,True,True,False,False,False,True,False,False,True,True,False,False,True,False,True,False,True,True,True,True,False,True,True,True,True,True,True,True,False,False,True,False,False,False,True,True,True,True,False,False,False,True,True,False,False,False,True,True,False,False,True,True,True,False,True,True,False,False,False,False,True,False,False,False,True,False,True,False,False,True,False,False,True,False,False,False,True,False,False,False,False,True,False,False,False,True,False,True,True,False,True,False,False,True,True,True,True,False,True,False,False,True,False,False,False,True,True,True,True,False,True,True,False,True,False,False,True,False,False,False,True,False,False,True,True,True,False,True,True,True,False,False,False,True,True,False,True,False,True,True,True,False,False,True,True,False,False,True,False,False,False,False,True,True,False,True,True,True,False,False,True,True,False,False,False,False,False,False,False,True,True,False,False,True,False,True,False,True,False]

rdBinPrime :: String
rdBinPrime = "1010100110011100010000010111101010111100000010001111110010111111000001111000011110001111000100111111011001110000010100001111011011010000001001010010001001111001001111000110010100001001011001111001111001011110010011000100111000101001010111000010001010010011010000101011000110111101111101111101000101000010111000110000110011000011101000111111110101110010011011111011111111111100110011000110011010011000100100010010000101111001010101010111101111111010011100001100101101010000110001010110110011111000001001010010100010100001100100011111000100110010111110001101101100001011100100011001011110001011100111101011101010001001010010100011000111000001111011100110010110001001010001111100111111011011011100111010011101011111100101011011111010001010010010010000100111000000011111010000011010011111001011011110010001001111110110110010100100000000111100010011011010101010000100111110111011000100110010101111011111110010001111000110001100111011000010001010010010001000010001011010011111010010111111100000101000110011000001010111100001000010011100111000000110000010110"

rdBinFull :: String
rdBinFull = "011011001100010100101001000110101011110000001000111100101101111101000011010000101010110010010011111001010111110000101000111110011011010000001001010010001001111001001111000110010100001001011001111001111001011110010011000100111000101001010111000010001010010011010000101011000110111101111101111101000101000010111000110000110011000011101000111111110101110010011011111011111111111100110011000110011010011000100100010010000101111001010101010111101111111010011100001100101101010000110001010110110011111000001001010010100010100001100100011111000100110010111110001101101100001011100100011001011110001011100111101011101010001001010010100011000111000001111011100110010110001001010001111100111111011011011100111010011101011111100101011011111010001010010010010000100111000000011111010000011010011111001011011110010001001111110110110010100100000000111100010011011010101010000100111110111011000100110010101111011111110010001111000110001100111011000010001010010010001000010001011010011110100100011110110100100010011101110001101011100110010000110111001100000001100101010"