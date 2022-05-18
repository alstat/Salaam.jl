function merge_features(db::AbstractCAMeLDB, prefix_feats::Vector, steam_feats::Vector, suffix_feats::Vector, diac_mode="AF")
    result = copy(stem_feats)

    for stem_feat in stem_feats
        suffix_feat_val = suffix_feats.get(stem_feat, "")
        if suffix_feat_val != "-" && suffix_feat_val != ""
            result[stem_feat] = suffix_feat_val
        end

        prefix_feat_val = prefix_feats.get(stem_feat, "")
        if prefix_feat_val != "-" && prefix_feat_val != ""
            result[stem_feat] = prefix_feat_val
        end
    end

    for join_feat in JOIN_FEATS
        if join_feat in db.defines
            feat_vals = [
                prefix_feats.get(join_feat, nothing),
                stem_feats.get(join_feat, nothing),
                suffix_feats.get(join_feat, nothing)
            ]
            result[join_feat] = join([!(fv isa Nothing) && (fv != "") ? fv : continue for fv in feat_vals], "+")
        end
    end

    for concat_feat in CONCAT_FEATS
        if concat_feat in db.defines
            result[concat_feat] = join(px for x in [prefix_feats.get(concat_feat, "")], "+")
        end
end