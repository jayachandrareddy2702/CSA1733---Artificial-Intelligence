diet(diabetes, 'Low sugar, high fiber, complex carbohydrates').
diet(hypertension, 'Low sodium, high potassium, DASH diet').
diet(heart_disease, 'Low fat, low cholesterol, Mediterranean diet').
diet(obesity, 'Calorie restriction, balanced nutrition, high fiber').
diet(anemia, 'High iron, vitamin C, lean proteins').
suggest_diet(Disease, RecommendedDiet) :-
    diet(Disease, RecommendedDiet).
