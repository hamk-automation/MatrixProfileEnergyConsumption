function df = df_truncating(df)
    idx_wd = find(df(:,4) == 1,1);
    idx_h = find(df(idx_wd:end,5) == 0,1);
    df = df(idx_wd+idx_h-1:end,:);
end