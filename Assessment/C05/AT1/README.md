# Crop Disease Advisory Expert System

A SWI-Prolog rule-based expert system for the CO5 AT1 Expert System Development Project.

## Scenario
Crop Disease Advisory System: identifies possible crop diseases from leaf symptoms, soil conditions, weather conditions and visible plant characteristics.

## Assessment coverage
- Problem/domain analysis
- Knowledge acquisition and representation
- IF-THEN production rules
- SWI-Prolog facts, predicates, variables, unification and backtracking
- Forward chaining
- Backward chaining
- Procedural vs non-procedural/declarative analysis
- Inference accuracy and test cases
- Documentation and GitHub-ready organization

## Run in SWI-Prolog
```prolog
?- [crop_expert_system].
?- test_case(1,F), diagnose_forward(F).
?- test_case(1,F), diagnose_backward(late_blight,F).
?- run_all_tests.
```

Interactive version:
```prolog
?- [crop_expert_interactive].
?- start.
```

## Repository structure
```text
crop-disease-advisory-expert-system/
├── knowledge_base.pl
├── crop_expert_system.pl
├── crop_expert_interactive.pl
├── procedural_equivalent.py
├── test_cases.txt
├── test_run_log.txt
├── README.md
├── references.md
├── .gitignore
└── diagrams/
    ├── architecture.png
    ├── forward_chaining.png
    ├── backward_chaining.png
    └── real_crop_disease_photos.md
```

## Real photographic references
The project uses real photographs from Wikimedia Commons for symptom reference. They are not AI-generated. License/author details are recorded in `references.md`.

![Late blight on tomato leaf](https://upload.wikimedia.org/wikipedia/commons/e/eb/Late_blight_on_tomato_leaf_%287871756748%29.jpg)

![Powdery mildew on soybean leaves](https://upload.wikimedia.org/wikipedia/commons/e/e7/Powdery_Mildew_on_Soyabean_leaves.jpg)
