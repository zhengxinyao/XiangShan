module FTBEntryGen(
  input  [38:0] io_start_addr,
  input         io_old_entry_valid,
  input  [2:0]  io_old_entry_brSlots_0_offset,
  input  [11:0] io_old_entry_brSlots_0_lower,
  input  [1:0]  io_old_entry_brSlots_0_tarStat,
  input         io_old_entry_brSlots_0_sharing,
  input         io_old_entry_brSlots_0_valid,
  input  [2:0]  io_old_entry_tailSlot_offset,
  input  [19:0] io_old_entry_tailSlot_lower,
  input  [1:0]  io_old_entry_tailSlot_tarStat,
  input         io_old_entry_tailSlot_sharing,
  input         io_old_entry_tailSlot_valid,
  input  [2:0]  io_old_entry_pftAddr,
  input         io_old_entry_carry,
  input         io_old_entry_isCall,
  input         io_old_entry_isRet,
  input         io_old_entry_isJalr,
  input         io_old_entry_last_may_be_rvi_call,
  input         io_old_entry_always_taken_0,
  input         io_old_entry_always_taken_1,
  input         io_pd_brMask_0,
  input         io_pd_brMask_1,
  input         io_pd_brMask_2,
  input         io_pd_brMask_3,
  input         io_pd_brMask_4,
  input         io_pd_brMask_5,
  input         io_pd_brMask_6,
  input         io_pd_brMask_7,
  input         io_pd_jmpInfo_valid,
  input         io_pd_jmpInfo_bits_0,
  input         io_pd_jmpInfo_bits_1,
  input         io_pd_jmpInfo_bits_2,
  input  [2:0]  io_pd_jmpOffset,
  input  [38:0] io_pd_jalTarget,
  input         io_pd_rvcMask_0,
  input         io_pd_rvcMask_1,
  input         io_pd_rvcMask_2,
  input         io_pd_rvcMask_3,
  input         io_pd_rvcMask_4,
  input         io_pd_rvcMask_5,
  input         io_pd_rvcMask_6,
  input         io_pd_rvcMask_7,
  input         io_cfiIndex_valid,
  input  [2:0]  io_cfiIndex_bits,
  input  [38:0] io_target,
  input         io_hit,
  input         io_mispredict_vec_0,
  input         io_mispredict_vec_1,
  input         io_mispredict_vec_2,
  input         io_mispredict_vec_3,
  input         io_mispredict_vec_4,
  input         io_mispredict_vec_5,
  input         io_mispredict_vec_6,
  input         io_mispredict_vec_7,
  output        io_new_entry_valid,
  output [2:0]  io_new_entry_brSlots_0_offset,
  output [11:0] io_new_entry_brSlots_0_lower,
  output [1:0]  io_new_entry_brSlots_0_tarStat,
  output        io_new_entry_brSlots_0_sharing,
  output        io_new_entry_brSlots_0_valid,
  output [2:0]  io_new_entry_tailSlot_offset,
  output [19:0] io_new_entry_tailSlot_lower,
  output [1:0]  io_new_entry_tailSlot_tarStat,
  output        io_new_entry_tailSlot_sharing,
  output        io_new_entry_tailSlot_valid,
  output [2:0]  io_new_entry_pftAddr,
  output        io_new_entry_carry,
  output        io_new_entry_isCall,
  output        io_new_entry_isRet,
  output        io_new_entry_isJalr,
  output        io_new_entry_last_may_be_rvi_call,
  output        io_new_entry_always_taken_0,
  output        io_new_entry_always_taken_1,
  output        io_taken_mask_0,
  output        io_taken_mask_1,
  output        io_jmp_taken,
  output        io_mispred_mask_0,
  output        io_mispred_mask_1,
  output        io_mispred_mask_2,
  output        io_is_old_entry
);
  wire  _GEN_1 = 3'h1 == io_cfiIndex_bits ? io_pd_brMask_1 : io_pd_brMask_0; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_2 = 3'h2 == io_cfiIndex_bits ? io_pd_brMask_2 : _GEN_1; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_3 = 3'h3 == io_cfiIndex_bits ? io_pd_brMask_3 : _GEN_2; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_4 = 3'h4 == io_cfiIndex_bits ? io_pd_brMask_4 : _GEN_3; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_5 = 3'h5 == io_cfiIndex_bits ? io_pd_brMask_5 : _GEN_4; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_6 = 3'h6 == io_cfiIndex_bits ? io_pd_brMask_6 : _GEN_5; // @[NewFtq.scala 247:{47,47}]
  wire  _GEN_7 = 3'h7 == io_cfiIndex_bits ? io_pd_brMask_7 : _GEN_6; // @[NewFtq.scala 247:{47,47}]
  wire  cfi_is_br = _GEN_7 & io_cfiIndex_valid; // @[NewFtq.scala 247:47]
  wire  new_jmp_is_jal = io_pd_jmpInfo_valid & ~io_pd_jmpInfo_bits_0 & io_cfiIndex_valid; // @[NewFtq.scala 249:62]
  wire  new_jmp_is_jalr = io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_0 & io_cfiIndex_valid; // @[NewFtq.scala 250:62]
  wire  new_jmp_is_call = io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_1 & io_cfiIndex_valid; // @[NewFtq.scala 251:62]
  wire  new_jmp_is_ret = io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_2 & io_cfiIndex_valid; // @[NewFtq.scala 252:62]
  wire  _last_jmp_rvi_T = io_pd_jmpOffset == 3'h7; // @[NewFtq.scala 253:52]
  wire  last_jmp_rvi = io_pd_jmpInfo_valid & io_pd_jmpOffset == 3'h7 & ~io_pd_rvcMask_7; // @[NewFtq.scala 253:75]
  wire  _cfi_is_jal_T = io_cfiIndex_bits == io_pd_jmpOffset; // @[NewFtq.scala 256:37]
  wire  cfi_is_jalr = _cfi_is_jal_T & new_jmp_is_jalr; // @[NewFtq.scala 257:55]
  wire [25:0] pc_higher = io_start_addr[38:13]; // @[FTB.scala 65:23]
  wire [25:0] target_higher = io_target[38:13]; // @[FTB.scala 66:31]
  wire [1:0] _stat_T_2 = target_higher < pc_higher ? 2'h2 : 2'h0; // @[FTB.scala 62:12]
  wire [1:0] stat = target_higher > pc_higher ? 2'h1 : _stat_T_2; // @[FTB.scala 61:10]
  wire [11:0] lower = io_target[12:1]; // @[FTB.scala 63:64]
  wire [2:0] init_entry_brSlots_0_offset = cfi_is_br ? io_cfiIndex_bits : 3'h0; // @[NewFtq.scala 267:20 269:25]
  wire [11:0] init_entry_brSlots_0_lower = cfi_is_br ? lower : 12'h0; // @[NewFtq.scala 267:20 FTB.scala 69:16]
  wire [1:0] init_entry_brSlots_0_tarStat = cfi_is_br ? stat : 2'h0; // @[NewFtq.scala 267:20 FTB.scala 70:18]
  wire [38:0] _T = cfi_is_jalr ? io_target : io_pd_jalTarget; // @[NewFtq.scala 278:64]
  wire [17:0] pc_higher_1 = io_start_addr[38:21]; // @[FTB.scala 65:23]
  wire [17:0] target_higher_1 = _T[38:21]; // @[FTB.scala 66:31]
  wire [1:0] _stat_T_5 = target_higher_1 < pc_higher_1 ? 2'h2 : 2'h0; // @[FTB.scala 62:12]
  wire [1:0] stat_1 = target_higher_1 > pc_higher_1 ? 2'h1 : _stat_T_5; // @[FTB.scala 61:10]
  wire [19:0] lower_1 = _T[20:1]; // @[FTB.scala 63:64]
  wire [2:0] init_entry_tailSlot_offset = io_pd_jmpInfo_valid ? io_pd_jmpOffset : 3'h0; // @[NewFtq.scala 275:24 276:32]
  wire  init_entry_tailSlot_valid = io_pd_jmpInfo_valid & (new_jmp_is_jal | new_jmp_is_jalr); // @[NewFtq.scala 275:24 277:31]
  wire [19:0] init_entry_tailSlot_lower = io_pd_jmpInfo_valid ? lower_1 : 20'h0; // @[NewFtq.scala 275:24 FTB.scala 69:16]
  wire [1:0] init_entry_tailSlot_tarStat = io_pd_jmpInfo_valid ? stat_1 : 2'h0; // @[NewFtq.scala 275:24 FTB.scala 70:18]
  wire [3:0] _jmpPft_T_1 = io_start_addr[3:1] + io_pd_jmpOffset; // @[NewFtq.scala 281:40]
  wire  _GEN_20 = 3'h1 == io_pd_jmpOffset ? io_pd_rvcMask_1 : io_pd_rvcMask_0; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_21 = 3'h2 == io_pd_jmpOffset ? io_pd_rvcMask_2 : _GEN_20; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_22 = 3'h3 == io_pd_jmpOffset ? io_pd_rvcMask_3 : _GEN_21; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_23 = 3'h4 == io_pd_jmpOffset ? io_pd_rvcMask_4 : _GEN_22; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_24 = 3'h5 == io_pd_jmpOffset ? io_pd_rvcMask_5 : _GEN_23; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_25 = 3'h6 == io_pd_jmpOffset ? io_pd_rvcMask_6 : _GEN_24; // @[NewFtq.scala 281:{62,62}]
  wire  _GEN_26 = 3'h7 == io_pd_jmpOffset ? io_pd_rvcMask_7 : _GEN_25; // @[NewFtq.scala 281:{62,62}]
  wire [1:0] _jmpPft_T_2 = _GEN_26 ? 2'h1 : 2'h2; // @[NewFtq.scala 281:62]
  wire [3:0] _GEN_87 = {{2'd0}, _jmpPft_T_2}; // @[NewFtq.scala 281:56]
  wire [4:0] jmpPft = _jmpPft_T_1 + _GEN_87; // @[NewFtq.scala 281:56]
  wire  _init_entry_pftAddr_T_1 = io_pd_jmpInfo_valid & ~last_jmp_rvi; // @[NewFtq.scala 282:43]
  wire [4:0] _init_entry_pftAddr_T_3 = io_pd_jmpInfo_valid & ~last_jmp_rvi ? jmpPft : {{2'd0}, io_start_addr[3:1]}; // @[NewFtq.scala 282:28]
  wire  init_entry_carry = _init_entry_pftAddr_T_1 ? jmpPft[3] : 1'h1; // @[NewFtq.scala 283:28]
  wire  init_entry_last_may_be_rvi_call = _last_jmp_rvi_T & ~_GEN_26; // @[NewFtq.scala 288:74]
  wire  br_recorded_vec_0 = io_old_entry_brSlots_0_valid & io_old_entry_brSlots_0_offset == io_cfiIndex_bits; // @[FTB.scala 184:32]
  wire  br_recorded_vec_1 = io_old_entry_tailSlot_valid & io_old_entry_tailSlot_offset == io_cfiIndex_bits &
    io_old_entry_tailSlot_sharing; // @[FTB.scala 185:53]
  wire [1:0] _br_recorded_T = {br_recorded_vec_1,br_recorded_vec_0}; // @[NewFtq.scala 293:37]
  wire  br_recorded = |_br_recorded_T; // @[NewFtq.scala 293:44]
  wire  is_new_br = cfi_is_br & ~br_recorded; // @[NewFtq.scala 294:29]
  wire  _new_br_insert_onehot_T = ~io_old_entry_brSlots_0_valid; // @[NewFtq.scala 301:9]
  wire  new_br_insert_onehot_0 = ~io_old_entry_brSlots_0_valid | io_cfiIndex_bits < io_old_entry_brSlots_0_offset; // @[NewFtq.scala 301:33]
  wire  _new_br_insert_onehot_T_3 = io_cfiIndex_bits > io_old_entry_brSlots_0_offset; // @[NewFtq.scala 303:53]
  wire  _new_br_insert_onehot_T_7 = ~io_old_entry_tailSlot_valid | io_cfiIndex_bits < io_old_entry_tailSlot_offset; // @[NewFtq.scala 304:36]
  wire  new_br_insert_onehot_1 = io_old_entry_brSlots_0_valid & io_cfiIndex_bits > io_old_entry_brSlots_0_offset &
    _new_br_insert_onehot_T_7; // @[NewFtq.scala 303:83]
  wire  _GEN_27 = _new_br_insert_onehot_T_3 ? 1'h0 : io_old_entry_always_taken_0; // @[NewFtq.scala 316:61 317:42]
  wire  old_entry_modified_brSlots_0_valid = new_br_insert_onehot_0 | io_old_entry_brSlots_0_valid; // @[NewFtq.scala 311:36 312:18]
  wire [2:0] old_entry_modified_brSlots_0_offset = new_br_insert_onehot_0 ? io_cfiIndex_bits :
    io_old_entry_brSlots_0_offset; // @[NewFtq.scala 311:36 313:19]
  wire [11:0] old_entry_modified_brSlots_0_lower = new_br_insert_onehot_0 ? lower : io_old_entry_brSlots_0_lower; // @[NewFtq.scala 311:36 FTB.scala 69:16]
  wire [1:0] old_entry_modified_brSlots_0_tarStat = new_br_insert_onehot_0 ? stat : io_old_entry_brSlots_0_tarStat; // @[NewFtq.scala 311:36 FTB.scala 70:18]
  wire  old_entry_modified_brSlots_0_sharing = new_br_insert_onehot_0 ? 1'h0 : io_old_entry_brSlots_0_sharing; // @[NewFtq.scala 311:36 FTB.scala 71:18]
  wire  old_entry_modified_always_taken_0 = new_br_insert_onehot_0 | _GEN_27; // @[NewFtq.scala 311:36 315:42]
  wire [19:0] lower_3 = {8'h0,lower}; // @[Cat.scala 31:58]
  wire [19:0] _old_entry_modified_tailSlot_lower_T = {8'h0,io_old_entry_brSlots_0_lower}; // @[Cat.scala 31:58]
  wire [2:0] _GEN_34 = ~_new_br_insert_onehot_T ? io_old_entry_brSlots_0_offset : io_old_entry_tailSlot_offset; // @[FTB.scala 119:17 NewFtq.scala 323:44]
  wire [1:0] _GEN_35 = ~_new_br_insert_onehot_T ? io_old_entry_brSlots_0_tarStat : io_old_entry_tailSlot_tarStat; // @[FTB.scala 120:18 NewFtq.scala 323:44]
  wire  _GEN_36 = ~_new_br_insert_onehot_T | io_old_entry_tailSlot_sharing; // @[FTB.scala 121:18 NewFtq.scala 323:44]
  wire  _GEN_37 = ~_new_br_insert_onehot_T ? io_old_entry_brSlots_0_valid : io_old_entry_tailSlot_valid; // @[FTB.scala 122:16 NewFtq.scala 323:44]
  wire [19:0] _GEN_38 = ~_new_br_insert_onehot_T ? _old_entry_modified_tailSlot_lower_T : io_old_entry_tailSlot_lower; // @[FTB.scala 123:16 NewFtq.scala 323:44]
  wire  _GEN_40 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? 1'h0 : io_old_entry_always_taken_1; // @[NewFtq.scala 316:61 317:42]
  wire [2:0] _GEN_41 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? io_old_entry_tailSlot_offset : _GEN_34; // @[NewFtq.scala 316:61]
  wire [1:0] _GEN_42 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? io_old_entry_tailSlot_tarStat : _GEN_35; // @[NewFtq.scala 316:61]
  wire  _GEN_43 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? io_old_entry_tailSlot_sharing : _GEN_36; // @[NewFtq.scala 316:61]
  wire  _GEN_44 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? io_old_entry_tailSlot_valid : _GEN_37; // @[NewFtq.scala 316:61]
  wire [19:0] _GEN_45 = io_cfiIndex_bits > io_old_entry_tailSlot_offset ? io_old_entry_tailSlot_lower : _GEN_38; // @[NewFtq.scala 316:61]
  wire  old_entry_modified_tailSlot_valid = new_br_insert_onehot_1 | _GEN_44; // @[NewFtq.scala 311:36 312:18]
  wire [2:0] old_entry_modified_tailSlot_offset = new_br_insert_onehot_1 ? io_cfiIndex_bits : _GEN_41; // @[NewFtq.scala 311:36 313:19]
  wire [19:0] old_entry_modified_tailSlot_lower = new_br_insert_onehot_1 ? lower_3 : _GEN_45; // @[NewFtq.scala 311:36 FTB.scala 69:16]
  wire [1:0] old_entry_modified_tailSlot_tarStat = new_br_insert_onehot_1 ? stat : _GEN_42; // @[NewFtq.scala 311:36 FTB.scala 70:18]
  wire  old_entry_modified_tailSlot_sharing = new_br_insert_onehot_1 | _GEN_43; // @[NewFtq.scala 311:36 FTB.scala 71:18]
  wire  old_entry_modified_always_taken_1 = new_br_insert_onehot_1 | _GEN_40; // @[NewFtq.scala 311:36 315:42]
  wire  may_have_to_replace = io_old_entry_brSlots_0_valid & io_old_entry_tailSlot_valid; // @[FTB.scala 198:61]
  wire  pft_need_to_change = is_new_br & may_have_to_replace; // @[NewFtq.scala 336:38]
  wire [1:0] _new_pft_offset_T = {new_br_insert_onehot_1,new_br_insert_onehot_0}; // @[NewFtq.scala 340:33]
  wire [2:0] new_pft_offset = ~(|_new_pft_offset_T) ? io_cfiIndex_bits : io_old_entry_tailSlot_offset; // @[NewFtq.scala 340:10]
  wire [3:0] _old_entry_modified_pftAddr_T_1 = io_start_addr[3:1] + new_pft_offset; // @[NewFtq.scala 344:59]
  wire [2:0] _old_entry_modified_pftAddr_T_2 = io_start_addr[3:1] + new_pft_offset; // @[NewFtq.scala 344:59]
  wire [2:0] old_entry_modified_pftAddr = pft_need_to_change ? _old_entry_modified_pftAddr_T_2 : io_old_entry_pftAddr; // @[NewFtq.scala 338:29 344:32]
  wire  old_entry_modified_carry = pft_need_to_change ? _old_entry_modified_pftAddr_T_1[3] : io_old_entry_carry; // @[NewFtq.scala 338:29 345:30]
  wire  old_entry_modified_last_may_be_rvi_call = pft_need_to_change ? 1'h0 : io_old_entry_last_may_be_rvi_call; // @[NewFtq.scala 338:29 346:45]
  wire  old_entry_modified_isCall = pft_need_to_change ? 1'h0 : io_old_entry_isCall; // @[NewFtq.scala 338:29 347:31]
  wire  old_entry_modified_isRet = pft_need_to_change ? 1'h0 : io_old_entry_isRet; // @[NewFtq.scala 338:29 348:30]
  wire  old_entry_modified_isJalr = pft_need_to_change ? 1'h0 : io_old_entry_isJalr; // @[NewFtq.scala 338:29 349:31]
  wire [25:0] old_target_higher_plus_one = pc_higher + 26'h1; // @[FTB.scala 90:30]
  wire [25:0] old_target_higher_minus_one = pc_higher - 26'h1; // @[FTB.scala 91:31]
  wire  _old_target_target_T = io_old_entry_tailSlot_tarStat == 2'h1; // @[FTB.scala 96:19]
  wire  _old_target_target_T_1 = io_old_entry_tailSlot_tarStat == 2'h2; // @[FTB.scala 97:19]
  wire  _old_target_target_T_2 = io_old_entry_tailSlot_tarStat == 2'h0; // @[FTB.scala 98:19]
  wire [25:0] _old_target_target_T_3 = _old_target_target_T ? old_target_higher_plus_one : 26'h0; // @[Mux.scala 27:73]
  wire [25:0] _old_target_target_T_4 = _old_target_target_T_1 ? old_target_higher_minus_one : 26'h0; // @[Mux.scala 27:73]
  wire [25:0] _old_target_target_T_5 = _old_target_target_T_2 ? pc_higher : 26'h0; // @[Mux.scala 27:73]
  wire [25:0] _old_target_target_T_6 = _old_target_target_T_3 | _old_target_target_T_4; // @[Mux.scala 27:73]
  wire [25:0] _old_target_target_T_7 = _old_target_target_T_6 | _old_target_target_T_5; // @[Mux.scala 27:73]
  wire [38:0] old_target_target = {_old_target_target_T_7,io_old_entry_tailSlot_lower[11:0],1'h0}; // @[Cat.scala 31:58]
  wire [17:0] old_target_higher_plus_one_1 = pc_higher_1 + 18'h1; // @[FTB.scala 90:30]
  wire [17:0] old_target_higher_minus_one_1 = pc_higher_1 - 18'h1; // @[FTB.scala 91:31]
  wire [17:0] _old_target_target_T_12 = _old_target_target_T ? old_target_higher_plus_one_1 : 18'h0; // @[Mux.scala 27:73]
  wire [17:0] _old_target_target_T_13 = _old_target_target_T_1 ? old_target_higher_minus_one_1 : 18'h0; // @[Mux.scala 27:73]
  wire [17:0] _old_target_target_T_14 = _old_target_target_T_2 ? pc_higher_1 : 18'h0; // @[Mux.scala 27:73]
  wire [17:0] _old_target_target_T_15 = _old_target_target_T_12 | _old_target_target_T_13; // @[Mux.scala 27:73]
  wire [17:0] _old_target_target_T_16 = _old_target_target_T_15 | _old_target_target_T_14; // @[Mux.scala 27:73]
  wire [38:0] old_target_target_1 = {_old_target_target_T_16,io_old_entry_tailSlot_lower,1'h0}; // @[Cat.scala 31:58]
  wire [38:0] old_target = io_old_entry_tailSlot_sharing ? old_target_target : old_target_target_1; // @[FTB.scala 107:10]
  wire  old_tail_is_jmp = ~io_old_entry_tailSlot_sharing; // @[NewFtq.scala 354:25]
  wire  jalr_target_modified = cfi_is_jalr & old_target != io_target & old_tail_is_jmp; // @[NewFtq.scala 355:72]
  wire [17:0] target_higher_4 = io_target[38:21]; // @[FTB.scala 66:31]
  wire [1:0] _stat_T_14 = target_higher_4 < pc_higher_1 ? 2'h2 : 2'h0; // @[FTB.scala 62:12]
  wire [1:0] stat_4 = target_higher_4 > pc_higher_1 ? 2'h1 : _stat_T_14; // @[FTB.scala 61:10]
  wire [19:0] lower_4 = io_target[20:1]; // @[FTB.scala 63:64]
  wire [19:0] old_entry_jmp_target_modified_tailSlot_lower = jalr_target_modified ? lower_4 :
    io_old_entry_tailSlot_lower; // @[NewFtq.scala 356:31 FTB.scala 69:16]
  wire [1:0] old_entry_jmp_target_modified_tailSlot_tarStat = jalr_target_modified ? stat_4 :
    io_old_entry_tailSlot_tarStat; // @[NewFtq.scala 356:31 FTB.scala 70:18]
  wire  old_entry_jmp_target_modified_tailSlot_sharing = jalr_target_modified ? 1'h0 : io_old_entry_tailSlot_sharing; // @[NewFtq.scala 356:31 FTB.scala 71:18]
  wire  old_entry_jmp_target_modified_always_taken_0 = jalr_target_modified ? 1'h0 : io_old_entry_always_taken_0; // @[NewFtq.scala 356:31 358:48]
  wire  old_entry_jmp_target_modified_always_taken_1 = jalr_target_modified ? 1'h0 : io_old_entry_always_taken_1; // @[NewFtq.scala 356:31 358:48]
  wire  _old_entry_always_taken_always_taken_0_T_1 = io_old_entry_tailSlot_valid & io_old_entry_tailSlot_sharing; // @[FTB.scala 193:47]
  wire  old_entry_always_taken_always_taken_0 = io_old_entry_always_taken_0 & io_cfiIndex_valid &
    io_old_entry_brSlots_0_valid & io_cfiIndex_bits == io_old_entry_brSlots_0_offset; // @[NewFtq.scala 365:65]
  wire  always_taken_modified_vec_0 = io_old_entry_always_taken_0 & ~old_entry_always_taken_always_taken_0; // @[NewFtq.scala 366:56]
  wire  old_entry_always_taken_always_taken_1 = io_old_entry_always_taken_1 & io_cfiIndex_valid &
    _old_entry_always_taken_always_taken_0_T_1 & io_cfiIndex_bits == io_old_entry_tailSlot_offset; // @[NewFtq.scala 365:65]
  wire  always_taken_modified_vec_1 = io_old_entry_always_taken_1 & ~old_entry_always_taken_always_taken_1; // @[NewFtq.scala 366:56]
  wire  always_taken_modified = always_taken_modified_vec_0 | always_taken_modified_vec_1; // @[NewFtq.scala 368:65]
  wire [19:0] _derived_from_old_entry_T_tailSlot_lower = jalr_target_modified ?
    old_entry_jmp_target_modified_tailSlot_lower : io_old_entry_tailSlot_lower; // @[NewFtq.scala 374:10]
  wire [1:0] _derived_from_old_entry_T_tailSlot_tarStat = jalr_target_modified ?
    old_entry_jmp_target_modified_tailSlot_tarStat : io_old_entry_tailSlot_tarStat; // @[NewFtq.scala 374:10]
  wire  _derived_from_old_entry_T_tailSlot_sharing = jalr_target_modified ?
    old_entry_jmp_target_modified_tailSlot_sharing : io_old_entry_tailSlot_sharing; // @[NewFtq.scala 374:10]
  wire  _derived_from_old_entry_T_always_taken_0 = jalr_target_modified ? old_entry_jmp_target_modified_always_taken_0
     : old_entry_always_taken_always_taken_0; // @[NewFtq.scala 374:10]
  wire  _derived_from_old_entry_T_always_taken_1 = jalr_target_modified ? old_entry_jmp_target_modified_always_taken_1
     : old_entry_always_taken_always_taken_1; // @[NewFtq.scala 374:10]
  wire [2:0] derived_from_old_entry_brSlots_0_offset = is_new_br ? old_entry_modified_brSlots_0_offset :
    io_old_entry_brSlots_0_offset; // @[NewFtq.scala 373:8]
  wire [11:0] derived_from_old_entry_brSlots_0_lower = is_new_br ? old_entry_modified_brSlots_0_lower :
    io_old_entry_brSlots_0_lower; // @[NewFtq.scala 373:8]
  wire [1:0] derived_from_old_entry_brSlots_0_tarStat = is_new_br ? old_entry_modified_brSlots_0_tarStat :
    io_old_entry_brSlots_0_tarStat; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_brSlots_0_sharing = is_new_br ? old_entry_modified_brSlots_0_sharing :
    io_old_entry_brSlots_0_sharing; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_brSlots_0_valid = is_new_br ? old_entry_modified_brSlots_0_valid :
    io_old_entry_brSlots_0_valid; // @[NewFtq.scala 373:8]
  wire [2:0] derived_from_old_entry_tailSlot_offset = is_new_br ? old_entry_modified_tailSlot_offset :
    io_old_entry_tailSlot_offset; // @[NewFtq.scala 373:8]
  wire [19:0] derived_from_old_entry_tailSlot_lower = is_new_br ? old_entry_modified_tailSlot_lower :
    _derived_from_old_entry_T_tailSlot_lower; // @[NewFtq.scala 373:8]
  wire [1:0] derived_from_old_entry_tailSlot_tarStat = is_new_br ? old_entry_modified_tailSlot_tarStat :
    _derived_from_old_entry_T_tailSlot_tarStat; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_tailSlot_sharing = is_new_br ? old_entry_modified_tailSlot_sharing :
    _derived_from_old_entry_T_tailSlot_sharing; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_tailSlot_valid = is_new_br ? old_entry_modified_tailSlot_valid :
    io_old_entry_tailSlot_valid; // @[NewFtq.scala 373:8]
  wire [2:0] derived_from_old_entry_pftAddr = is_new_br ? old_entry_modified_pftAddr : io_old_entry_pftAddr; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_carry = is_new_br ? old_entry_modified_carry : io_old_entry_carry; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_isCall = is_new_br ? old_entry_modified_isCall : io_old_entry_isCall; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_isRet = is_new_br ? old_entry_modified_isRet : io_old_entry_isRet; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_isJalr = is_new_br ? old_entry_modified_isJalr : io_old_entry_isJalr; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_last_may_be_rvi_call = is_new_br ? old_entry_modified_last_may_be_rvi_call :
    io_old_entry_last_may_be_rvi_call; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_always_taken_0 = is_new_br ? old_entry_modified_always_taken_0 :
    _derived_from_old_entry_T_always_taken_0; // @[NewFtq.scala 373:8]
  wire  derived_from_old_entry_always_taken_1 = is_new_br ? old_entry_modified_always_taken_1 :
    _derived_from_old_entry_T_always_taken_1; // @[NewFtq.scala 373:8]
  wire [2:0] init_entry_pftAddr = _init_entry_pftAddr_T_3[2:0];
  wire  _T_4 = io_new_entry_tailSlot_valid & io_new_entry_tailSlot_sharing; // @[FTB.scala 193:47]
  wire  _io_jmp_taken_T_1 = io_new_entry_tailSlot_valid & ~io_new_entry_tailSlot_sharing; // @[FTB.scala 207:20]
  wire  _GEN_64 = 3'h1 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_1 : io_mispredict_vec_0; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_65 = 3'h2 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_2 : _GEN_64; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_66 = 3'h3 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_3 : _GEN_65; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_67 = 3'h4 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_4 : _GEN_66; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_68 = 3'h5 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_5 : _GEN_67; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_69 = 3'h6 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_6 : _GEN_68; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_70 = 3'h7 == io_new_entry_brSlots_0_offset ? io_mispredict_vec_7 : _GEN_69; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_72 = 3'h1 == io_new_entry_tailSlot_offset ? io_mispredict_vec_1 : io_mispredict_vec_0; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_73 = 3'h2 == io_new_entry_tailSlot_offset ? io_mispredict_vec_2 : _GEN_72; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_74 = 3'h3 == io_new_entry_tailSlot_offset ? io_mispredict_vec_3 : _GEN_73; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_75 = 3'h4 == io_new_entry_tailSlot_offset ? io_mispredict_vec_4 : _GEN_74; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_76 = 3'h5 == io_new_entry_tailSlot_offset ? io_mispredict_vec_5 : _GEN_75; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_77 = 3'h6 == io_new_entry_tailSlot_offset ? io_mispredict_vec_6 : _GEN_76; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_78 = 3'h7 == io_new_entry_tailSlot_offset ? io_mispredict_vec_7 : _GEN_77; // @[NewFtq.scala 385:{52,52}]
  wire  _GEN_80 = 3'h1 == io_pd_jmpOffset ? io_mispredict_vec_1 : io_mispredict_vec_0; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_81 = 3'h2 == io_pd_jmpOffset ? io_mispredict_vec_2 : _GEN_80; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_82 = 3'h3 == io_pd_jmpOffset ? io_mispredict_vec_3 : _GEN_81; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_83 = 3'h4 == io_pd_jmpOffset ? io_mispredict_vec_4 : _GEN_82; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_84 = 3'h5 == io_pd_jmpOffset ? io_mispredict_vec_5 : _GEN_83; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_85 = 3'h6 == io_pd_jmpOffset ? io_mispredict_vec_6 : _GEN_84; // @[NewFtq.scala 387:{49,49}]
  wire  _GEN_86 = 3'h7 == io_pd_jmpOffset ? io_mispredict_vec_7 : _GEN_85; // @[NewFtq.scala 387:{49,49}]
  assign io_new_entry_valid = ~io_hit | io_old_entry_valid; // @[NewFtq.scala 377:22]
  assign io_new_entry_brSlots_0_offset = ~io_hit ? init_entry_brSlots_0_offset : derived_from_old_entry_brSlots_0_offset
    ; // @[NewFtq.scala 377:22]
  assign io_new_entry_brSlots_0_lower = ~io_hit ? init_entry_brSlots_0_lower : derived_from_old_entry_brSlots_0_lower; // @[NewFtq.scala 377:22]
  assign io_new_entry_brSlots_0_tarStat = ~io_hit ? init_entry_brSlots_0_tarStat :
    derived_from_old_entry_brSlots_0_tarStat; // @[NewFtq.scala 377:22]
  assign io_new_entry_brSlots_0_sharing = ~io_hit ? 1'h0 : derived_from_old_entry_brSlots_0_sharing; // @[NewFtq.scala 377:22]
  assign io_new_entry_brSlots_0_valid = ~io_hit ? cfi_is_br : derived_from_old_entry_brSlots_0_valid; // @[NewFtq.scala 377:22]
  assign io_new_entry_tailSlot_offset = ~io_hit ? init_entry_tailSlot_offset : derived_from_old_entry_tailSlot_offset; // @[NewFtq.scala 377:22]
  assign io_new_entry_tailSlot_lower = ~io_hit ? init_entry_tailSlot_lower : derived_from_old_entry_tailSlot_lower; // @[NewFtq.scala 377:22]
  assign io_new_entry_tailSlot_tarStat = ~io_hit ? init_entry_tailSlot_tarStat : derived_from_old_entry_tailSlot_tarStat
    ; // @[NewFtq.scala 377:22]
  assign io_new_entry_tailSlot_sharing = ~io_hit ? 1'h0 : derived_from_old_entry_tailSlot_sharing; // @[NewFtq.scala 377:22]
  assign io_new_entry_tailSlot_valid = ~io_hit ? init_entry_tailSlot_valid : derived_from_old_entry_tailSlot_valid; // @[NewFtq.scala 377:22]
  assign io_new_entry_pftAddr = ~io_hit ? init_entry_pftAddr : derived_from_old_entry_pftAddr; // @[NewFtq.scala 377:22]
  assign io_new_entry_carry = ~io_hit ? init_entry_carry : derived_from_old_entry_carry; // @[NewFtq.scala 377:22]
  assign io_new_entry_isCall = ~io_hit ? new_jmp_is_call : derived_from_old_entry_isCall; // @[NewFtq.scala 377:22]
  assign io_new_entry_isRet = ~io_hit ? new_jmp_is_ret : derived_from_old_entry_isRet; // @[NewFtq.scala 377:22]
  assign io_new_entry_isJalr = ~io_hit ? new_jmp_is_jalr : derived_from_old_entry_isJalr; // @[NewFtq.scala 377:22]
  assign io_new_entry_last_may_be_rvi_call = ~io_hit ? init_entry_last_may_be_rvi_call :
    derived_from_old_entry_last_may_be_rvi_call; // @[NewFtq.scala 377:22]
  assign io_new_entry_always_taken_0 = ~io_hit ? cfi_is_br : derived_from_old_entry_always_taken_0; // @[NewFtq.scala 377:22]
  assign io_new_entry_always_taken_1 = ~io_hit ? 1'h0 : derived_from_old_entry_always_taken_1; // @[NewFtq.scala 377:22]
  assign io_taken_mask_0 = io_cfiIndex_bits == io_new_entry_brSlots_0_offset & io_cfiIndex_valid &
    io_new_entry_brSlots_0_valid; // @[NewFtq.scala 381:68]
  assign io_taken_mask_1 = io_cfiIndex_bits == io_new_entry_tailSlot_offset & io_cfiIndex_valid & _T_4; // @[NewFtq.scala 381:68]
  assign io_jmp_taken = _io_jmp_taken_T_1 & io_new_entry_tailSlot_offset == io_cfiIndex_bits; // @[NewFtq.scala 383:41]
  assign io_mispred_mask_0 = io_new_entry_brSlots_0_valid & _GEN_70; // @[NewFtq.scala 385:52]
  assign io_mispred_mask_1 = _T_4 & _GEN_78; // @[NewFtq.scala 385:52]
  assign io_mispred_mask_2 = _io_jmp_taken_T_1 & _GEN_86; // @[NewFtq.scala 387:49]
  assign io_is_old_entry = io_hit & ~is_new_br & ~jalr_target_modified & ~always_taken_modified; // @[NewFtq.scala 391:65]
endmodule

