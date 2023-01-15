lines = []
io_targets = {
    "ExceptionGen": [
        " io_redirect_",
        " io_state_"
    ],
    "CSR": [
        "csrio_exception_bits_uop_cf_pc"
    ],
    "Rob": [
        "io_commits_isCommit",
        "io_commits_commitValid",
        "io_commits_isWalk",
        "io_lsq_pendingld",
        "io_lsq_pendingst",
        "io_csr_intrBitSet",
    ],
    "LoadQueue": [
        "io_uncache",
    ],
    "LoadUnit": [
        "io_ldin_ready",
        "io_ldin_valid",
        "io_ldin_bits_uop_robIdx_value",
        "io_ldin_bits_uop_lqIdx_value",
        "io_ldout_valid",
        "io_dcache_req_valid",
        "io_dcache_req_ready",
        "io_dcache_resp_bits_miss",
        "io_dcache_resp_bits_replay",
        "io_dcache_s1_kill",
        "io_dcache_s2_kill",
        "io_dcache_s1_disable_fast_wakeup",
        "io_dcache_s1_bank_conflict",
        "io_dcache_s2_hit",
        "io_sbuffer_matchInvalid",
        "io_lsq_loadIn_valid",
        "io_lsq_loadIn_bits_miss",
        "io_lsq_loadIn_bits_mmio",
        "io_lsq_ldout_valid",
        "io_lsq_ldout_ready",
        "io_lsq_loadViolationQuery_req_valid",
        "io_lsq_loadViolationQuery_req_ready",
        "io_lsq_loadViolationQuery_resp_valid",
        "io_lsq_loadViolationQuery_resp_bits_have_violation",
        "io_tlb_req_valid",
        "io_tlb_req_kill",
        "io_tlb_resp_bits_miss",
        "io_tlb_resp_bits_fast_miss",
        "io_tlb_resp_bits_excp_0_pf_ld",
        "io_tlb_resp_bits_excp_0_af_ld",
        "io_tlb_resp_bits_static_pm_valid",
        "io_tlb_resp_bits_static_pm_bits",
        "io_s2IsPointerChasing"
    ],
    "LsqEnqCtrl": [
        "io_enq_canAccept"
    ],
    "Rob": [
        "io_flushOut_valid",
        "io_flushOut_bits_robIdx_flag",
        "io_flushOut_bits_robIdx_value",
        "io_flushOut_bits_level",
        "io_csr_intrBitSet",
        "io_commits_isCommit",
        "io_commits_commitValid",
        "io_commits_isWalk",
        "io_lsq_pendingld",
        "io_lsq_pendingst"
        "io_csr_intrBitSet",
        "io_csr_wfiEvent",
    ],
    # L1 keep replay extra ila
    "MainPipe": [
        "io_data_read_intend",
        "io_data_read_valid",
        "io_data_write_valid",
        "io_miss_req_valid",
        "io_miss_req_bits_id",
        "io_miss_req_bits_cmd",
        "io_probe_req_ready",
        "io_probe_req_valid",
        "io_miss_req_ready",
        "io_miss_req_valid",
        "io_store_req_ready",
        "io_store_req_valid",
        "io_atomic_req_ready",
        "io_atomic_req_valid",
        "io_replace_req_ready",
        "io_replace_req_valid",
        "io_wb_ready",
        "io_wb_valid",
    ],
    "LoadPipe": [
        "io_miss_req_ready",
        "io_miss_req_valid",
        "io_bank_conflict_slow",
    ],
    "ProbeQueue": [
        "io_mem_probe_ready",
        "io_mem_probe_valid",
    ],
    "MissQueue": [
        "io_refill_pipe_req_ready",
        "io_refill_pipe_req_valid",
        "io_refill_pipe_resp_valid",
        "io_replace_pipe_req_ready",
        "io_replace_pipe_req_valid",
        "io_replace_pipe_resp_valid",
        "io_main_pipe_req_ready",
        "io_main_pipe_req_valid",
        "io_main_pipe_resp_valid",
    ],
    "Sbuffer": [
        "io_dcache_req_ready",
        "io_dcache_req_valid",
        "io_dcache_main_pipe_hit_resp_valid",
        "io_dcache_main_pipe_hit_resp_bits_id",
        "io_dcache_refill_hit_resp_valid",
        "io_dcache_refill_hit_resp_bits_id",
        "io_dcache_replay_resp_valid",
        "io_dcache_replay_resp_bits_id",
    ],
    "SinkC": [
        "io_c_ready",
        "io_c_valid",
        "io_alloc_ready",
        "io_alloc_valid",
        "io_bs_waddr_ready",
        "io_bs_waddr_valid",
        "io_bs_waddr_bits_noop",
        "io_release_ready",
        "io_release_valid",
    ],
    "MSHR": [
        "io_status_valid"
    ],
    "WritebackQueue": [
        "io_miss_req_valid",
        "io_miss_req_bits",
        "io_mem_release_ready",
        "io_mem_release_valid",
        "io_mem_release_bits_opcode",
        "io_mem_release_bits_param",
        "io_mem_release_bits_source",
        "io_mem_grant_valid",
        "io_mem_grant_bits_source",
    ],
    "WritebackEntry": [
        "io_release_update_valid",
        "io_release_update_bits_addr",
        "io_secondary_valid",
        "io_secondary_ready"
    ],
    "WritebackEntry_16": [
        "io_release_update_valid",
        "io_release_update_bits_addr",
        "io_secondary_valid",
        "io_secondary_ready"
    ]
}
other_targets = {
    "RobEnqPtrWrapper": [
        "reg  enqPtrVec_0_flag;",
        "reg [7:0] enqPtrVec_0_value;"
    ],
    "RobDeqPtrWrapper": [
        "reg  deqPtrVec_0_flag;",
        "reg [7:0] deqPtrVec_0_value;"
    ],
    "Rob": [
        "wire  exceptionEnable",
        "wire  intrEnable",
        "wire  isFlushPipe"
    ],
    # LQ
    "LoadQueue": {
        "reg  enqPtrExt_0_flag",
        "reg [5:0] enqPtrExt_0_value",
        "reg  deqPtrExt_flag",
        "reg [5:0] deqPtrExt_value",
        "reg [2:0] commitCount",
        # "reg  pending_",
        # "reg  miss_",
        # "reg  released_",
        # "reg  writebacked_",
        # "reg  datavalid_",
        # "reg  allocated_",
        "reg [1:0] uncacheState"
    },
    # L1 MSHR
    "MissEntry": {
        "reg  req_valid"
        # "reg  s_acquire",
        # "reg  s_grantack",
        # "reg  s_replace_req",
        # "reg  s_refill",
        # "reg  s_mainpipe_req",
        # "reg  s_write_storedata",
        # "reg  w_grantfirst",
        # "reg  w_grantlast",
        # "reg  w_replace_resp",
        # "reg  w_refill_resp",
        # "reg  w_mainpipe_resp",
    },
    # L1 keep replay extra ila
    "LoadPipe": {
        "wire  s2_nack_no_mshr",
        "reg  s2_nack_data",
    },
    "Sbuffer": {
        "reg [1:0] sbuffer_state",
        "reg  stateVec_",
    },
    "MissQueue": [
        "wire  merge",
        "wire  reject",
        "wire  alloc",
    ],
    "ProbeEntry": [
        "reg [1:0] state",
    ],
    # Atom FSM
    "AtomicsUnit": {
        "reg [2:0] state"
    },

    "SinkC": {
        "wire  full",
        "wire  noSpace",
        "reg  busy"
    },
    "MSHR": {
        "reg [2:0] req_channel",
        "reg [2:0] req_opcode"
    },
    "WritebackQueue": {
        "wire  ila_flag"
    },
    "WritebackEntry": {
        "reg [1:0] state;",
        "reg [35:0] paddr_dup_0",
        "reg  req_voluntary",
        "reg [3:0] req_miss_id",
        "reg  req_hasData",
        "reg [2:0] req_param",
        "reg  req_dirty",
        "reg  s_data_override",
        "reg  s_data_merge",
        "reg [1:0] remain;",
        "wire [1:0] remain_set",
        "wire [1:0] remain_clr",
        "wire  update",
        "wire  merge",
        "reg  release_later",
        "wire  release_done ",
        "wire  ila_flag"
    },
    "WritebackEntry_16": {
        "reg [1:0] state;",
        "reg [35:0] paddr_dup_0",
        "reg  req_voluntary",
        "reg [3:0] req_miss_id",
        "reg  req_hasData",
        "reg [2:0] req_param",
        "reg  req_dirty",
        "reg  s_data_override",
        "reg  s_data_merge",
        "reg [1:0] remain;",
        "wire [1:0] remain_set",
        "wire [1:0] remain_clr",
        "wire  update",
        "wire  merge",
        "reg  release_later",
        "wire  release_done ",
        "wire  ila_flag"
    }
}
disabled = [
    "clock,",
    "reset,",
    "csrio_perf_",
    "csrio_customCtrl_",
    "csrio_distributedUpdate",
    "csrio_tlb_",
    "csrio_hartId",
    "csrio_disableSfence",
    "cf_pd",
    "csrio_fpu",
]

with open("XSTop.v") as f:
    in_module = None
    for line in f:
        if line.startswith("module "):
            in_module = line.strip()[7:-1]
        elif in_module is not None:
            is_match = False
            if (line.startswith("  input ") or line.startswith("  output ")) and in_module in io_targets.keys():
                for keyword in io_targets[in_module]:
                    if keyword in line:
                        is_match = True
            if in_module in other_targets.keys():
                for keyword in other_targets[in_module]:
                    if keyword in line:
                        is_match = True
            if is_match:
                for d in disabled:
                    if d in line:
                        is_match = False
            if is_match:
                line = '  (*mark_debug = "true"*)' + line
        lines += line

with open("XSTop_out.v", "w") as f:
    f.writelines(lines)
