def diagnose_procedural(facts):
    if {'crop(tomato)', 'leaf_spots(dark_brown)', 'humidity(high)'} <= set(facts):
        return 'late_blight'
    if {'crop(tomato)', 'lesion(water_soaked)', 'weather(rainy)'} <= set(facts):
        return 'late_blight'
    if {'crop(soybean)', 'leaf_surface(white_powder)', 'weather(cool_dry)'} <= set(facts):
        return 'powdery_mildew'
    if {'crop(rice)', 'leaf_tip(water_soaked)', 'leaf_color(yellow)'} <= set(facts):
        return 'bacterial_leaf_blight'
    if {'leaf_pattern(yellow_mosaic)', 'growth(stunted)'} <= set(facts):
        return 'viral_mosaic'
    if {'soil_drainage(poor)', 'symptom(root_rot)', 'symptom(wilting)'} <= set(facts):
        return 'root_rot'
    return None

if __name__ == '__main__':
    print(diagnose_procedural(['crop(tomato)', 'leaf_spots(dark_brown)', 'humidity(high)']))
