module decoder_bin_hex_7seg(
    input w,
    input x,
    input y,
    input z,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g
    );
    
    assign seg_a = (~w&x&~y&~z)|(w&~x&y&z)|(w&x&~y&z)|(~w&~x&~y&z);
    assign seg_b = (~w&x&~y&z)|(w&x&~z)|(x&y&~z)|(w&y&z);
    assign seg_c = (~w&~x&y&~z)|(w&x&~z)|(w&x&y);
    assign seg_d = (~w&x&~y&~z)|(w&~x&y&~z)|(x&y&z)|(~x&~y&z);
    assign seg_e = (~w&z)|(~x&~y&z)|(~w&x&~y);
    assign seg_f = (~w&~x&z)|(~w&~x&y)|(~w&y&z)|(w&x&~y&z);
    assign seg_g = (~w&~x&~y)|(~w&x&y&z)|(w&x&~y&~z);
    
endmodule