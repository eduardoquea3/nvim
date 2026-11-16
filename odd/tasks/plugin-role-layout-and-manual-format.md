# Plugin role layout and manual formatting
Scope: classify the Neovim plugin specs by responsibility and make Conform formatting manual-only.
Constraints: preserve plugin behavior except the explicitly requested load/layout decisions; keep the Snacks picker as primary symbol navigation.

## Specs
1. S1: “pero los demas archivos de /lua/plugins tambien hazle una clasificacion de acuerdo a lo que hacen” — organize the remaining plugin specs into responsibility-based folders, with an understandable mapping and no unnecessary plugin substitutions.
2. S2: “'Conform' haz que se formatee con alt+s y no q se haga al guardar” — retain the explicit Alt-S formatter mapping and stop formatting on save.

## Tasks
- T1 [S1] Classify and reorganize all plugin specs by responsibility, update architecture documentation; commit `814a23c`.
- T2 [S2] Make Conform format only on Alt-S, update formatting documentation; commit `3a698df`.

## Log
- L1: “pero los demas archivos de /lua/plugins tambien hazle una clasificacion de acuerdo a lo que hacen, aparte tambie 'Conform' haz que se formatee con alt+s y no q se haga al guardar”
- L2: Prior selections: “Snacks picker (Recomendado)” and “Conservar y diferir (Recomendado)”. Keep the editing plugins; defer them where their current loading behavior supports it.
- L3: T1 completed in `814a23c`: categorized 36 plugin specs into 8 folders, explicitly imported each folder, and updated the architecture map. Lua syntax and structural/import checks passed; the full Lazy.nvim runtime was not exercised.
- L4: T2 completed in `3a698df`: removed Conform's save event and `BufWritePre` formatting autocmd while preserving Alt-S in normal/visual mode. Manual-only assertion, Lua syntax checks, and `git diff --check` passed.
