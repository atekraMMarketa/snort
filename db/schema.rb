# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181009042008) do

  create_table "acid_ag", primary_key: "ag_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ag_name", limit: 40
    t.text "ag_desc"
    t.datetime "ag_ctime"
    t.datetime "ag_ltime"
    t.index ["ag_id"], name: "ag_id"
  end

  create_table "acid_ag_alert", primary_key: ["ag_id", "ag_sid", "ag_cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ag_id", null: false, unsigned: true
    t.integer "ag_sid", null: false, unsigned: true
    t.integer "ag_cid", null: false, unsigned: true
    t.index ["ag_id"], name: "ag_id"
    t.index ["ag_sid", "ag_cid"], name: "ag_sid"
  end

  create_table "acid_event", primary_key: ["sid", "cid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "sid", null: false, unsigned: true
    t.integer "cid", null: false, unsigned: true
    t.integer "signature", null: false, unsigned: true
    t.string "sig_name"
    t.integer "sig_class_id", unsigned: true
    t.integer "sig_priority", unsigned: true
    t.datetime "timestamp", null: false
    t.integer "ip_src", unsigned: true
    t.integer "ip_dst", unsigned: true
    t.integer "ip_proto"
    t.integer "layer4_sport", unsigned: true
    t.integer "layer4_dport", unsigned: true
    t.index ["ip_dst"], name: "ip_dst"
    t.index ["ip_proto"], name: "ip_proto"
    t.index ["ip_src"], name: "ip_src"
    t.index ["layer4_dport"], name: "layer4_dport"
    t.index ["layer4_sport"], name: "layer4_sport"
    t.index ["sig_class_id"], name: "sig_class_id"
    t.index ["sig_name"], name: "sig_name"
    t.index ["sig_priority"], name: "sig_priority"
    t.index ["signature"], name: "signature"
    t.index ["timestamp"], name: "timestamp"
  end

  create_table "acid_ip_cache", primary_key: "ipc_ip", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ipc_fqdn", limit: 50
    t.datetime "ipc_dns_timestamp"
    t.text "ipc_whois"
    t.datetime "ipc_whois_timestamp"
    t.index ["ipc_ip"], name: "ipc_ip"
  end

  create_table "base_roles", primary_key: "role_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "role_name", limit: 20, null: false
    t.string "role_desc", limit: 75, null: false
  end

  create_table "base_users", primary_key: "usr_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "usr_login", limit: 25, null: false
    t.string "usr_pwd", limit: 32, null: false
    t.string "usr_name", limit: 75, null: false
    t.integer "role_id", null: false
    t.integer "usr_enabled", null: false
    t.index ["usr_login"], name: "usr_login"
  end

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
    t.integer "signature_id", null: false, unsigned: true
    t.datetime "timestamp", null: false
    t.index ["signature_id"], name: "sig"
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

  create_table "schema", primary_key: "vseq", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "ctime", null: false
  end

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
