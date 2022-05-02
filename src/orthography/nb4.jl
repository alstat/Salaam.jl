using Salaam

db = MorphologyDB(:egy, :r);
db
egy_db = load(db)
egy_db.prefix_stem_compat
analyze = Analyzer()