% Knowledge base for Crop Disease Advisory Expert System
rule(r1,[crop(tomato),leaf_spots(dark_brown),humidity(high)],diagnosis(late_blight)).
rule(r2,[crop(tomato),lesion(water_soaked),weather(rainy)],diagnosis(late_blight)).
rule(r3,[crop(soybean),leaf_surface(white_powder),weather(cool_dry)],diagnosis(powdery_mildew)).
rule(r4,[crop(rice),leaf_tip(water_soaked),leaf_color(yellow)],diagnosis(bacterial_leaf_blight)).
rule(r5,[leaf_pattern(yellow_mosaic),growth(stunted)],diagnosis(viral_mosaic)).
rule(r6,[soil_drainage(poor),symptom(root_rot),symptom(wilting)],diagnosis(root_rot)).

rule(a1,[diagnosis(late_blight)],advice('Scout frequently, remove infected material where appropriate, keep foliage dry, and seek local extension guidance.')).
rule(a2,[diagnosis(powdery_mildew)],advice('Scout affected leaves, improve crop management, and use locally approved control measures when required.')).
rule(a3,[diagnosis(bacterial_leaf_blight)],advice('Follow locally recommended bacterial disease management and remove severely affected material where appropriate.')).
rule(a4,[diagnosis(viral_mosaic)],advice('Remove severely affected plants where appropriate and manage likely vectors using integrated crop management.')).
rule(a5,[diagnosis(root_rot)],advice('Improve drainage, avoid prolonged waterlogging, and inspect roots and soil conditions.')).
