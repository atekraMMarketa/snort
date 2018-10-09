class CreateDatabaseStructure < ActiveRecord::Migration[5.1]
  def self.up

    create_table "data", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.text "data_payload"
    end

    create_table "detail", primary_key: "detail_type", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.text "detail_text", null: false
    end

    create_table "encoding", primary_key: "encoding_type", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.text "encoding_text", null: false
    end

    create_table "event", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "signature", null: false, unsigned: true
      t.datetime "timestamp", null: false
      t.index ["signature"], name: "sig"
      t.index ["timestamp"], name: "time"
    end

    create_table "icmphdr", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "icmp_type", limit: 1, null: false, unsigned: true
      t.integer "icmp_code", limit: 1, null: false, unsigned: true
      t.integer "icmp_csum", limit: 2, unsigned: true
      t.integer "icmp_id", limit: 2, unsigned: true
      t.integer "icmp_seq", limit: 2, unsigned: true
      t.index ["icmp_type"], name: "icmp_type"
    end

    create_table "iphdr", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "ip_src", null: false, unsigned: true
      t.integer "ip_dst", null: false, unsigned: true
      t.integer "ip_ver", limit: 1, unsigned: true
      t.integer "ip_hlen", limit: 1, unsigned: true
      t.integer "ip_tos", limit: 1, unsigned: true
      t.integer "ip_len", limit: 2, unsigned: true
      t.integer "ip_id", limit: 2, unsigned: true
      t.integer "ip_flags", limit: 1, unsigned: true
      t.integer "ip_off", limit: 2, unsigned: true
      t.integer "ip_ttl", limit: 1, unsigned: true
      t.integer "ip_proto", limit: 1, null: false, unsigned: true
      t.integer "ip_csum", limit: 2, unsigned: true
      t.index ["ip_dst"], name: "ip_dst"
      t.index ["ip_src"], name: "ip_src"
    end

    create_table "opt", primary_key: ["sid", "cid", "optid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "optid", null: false, unsigned: true
      t.integer "opt_proto", limit: 1, null: false, unsigned: true
      t.integer "opt_code", limit: 1, null: false, unsigned: true
      t.integer "opt_len", limit: 2
      t.text "opt_data"
    end

    create_table "reference", primary_key: "ref_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "ref_system_id", null: false, unsigned: true
      t.text "ref_tag", null: false
    end

    create_table "reference_system", primary_key: "ref_system_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.string "ref_system_name", limit: 20
    end

    #create_table "schema", primary_key: "vseq", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    #  t.datetime "ctime", null: false
    #end

    create_table "sensor", primary_key: "sid", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.text "hostname"
      t.text "interface"
      t.text "filter"
      t.integer "detail", limit: 1
      t.integer "encoding", limit: 1
      t.integer "last_cid", null: false, unsigned: true
    end

    create_table "sig_class", primary_key: "sig_class_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.string "sig_class_name", limit: 60, null: false
      t.index ["sig_class_id"], name: "sig_class_id"
      t.index ["sig_class_name"], name: "sig_class_name"
    end

    create_table "sig_reference", primary_key: ["sig_id", "ref_seq"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sig_id", null: false, unsigned: true
      t.integer "ref_seq", null: false, unsigned: true
      t.integer "ref_id", null: false, unsigned: true
    end

    create_table "signature", primary_key: "sig_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.string "sig_name", null: false
      t.integer "sig_class_id", null: false, unsigned: true
      t.integer "sig_priority", unsigned: true
      t.integer "sig_rev", unsigned: true
      t.integer "sig_sid", unsigned: true
      t.integer "sig_gid", unsigned: true
      t.index ["sig_class_id"], name: "sig_class_id_idx"
      t.index ["sig_name"], name: "sign_idx", length: { sig_name: 20 }
    end

    create_table "tcphdr", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "tcp_sport", limit: 2, null: false, unsigned: true
      t.integer "tcp_dport", limit: 2, null: false, unsigned: true
      t.integer "tcp_seq", unsigned: true
      t.integer "tcp_ack", unsigned: true
      t.integer "tcp_off", limit: 1, unsigned: true
      t.integer "tcp_res", limit: 1, unsigned: true
      t.integer "tcp_flags", limit: 1, null: false, unsigned: true
      t.integer "tcp_win", limit: 2, unsigned: true
      t.integer "tcp_csum", limit: 2, unsigned: true
      t.integer "tcp_urp", limit: 2, unsigned: true
      t.index ["tcp_dport"], name: "tcp_dport"
      t.index ["tcp_flags"], name: "tcp_flags"
      t.index ["tcp_sport"], name: "tcp_sport"
    end

    create_table "udphdr", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.integer "sid", null: false, unsigned: true
      t.integer "cid", null: false, unsigned: true
      t.integer "udp_sport", limit: 2, null: false, unsigned: true
      t.integer "udp_dport", limit: 2, null: false, unsigned: true
      t.integer "udp_len", limit: 2, unsigned: true
      t.integer "udp_csum", limit: 2, unsigned: true
      t.index ["udp_dport"], name: "udp_dport"
      t.index ["udp_sport"], name: "udp_sport"
    end
  end
end