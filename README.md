# cocktails-demo

This app was largely created by ChatGPT with some light hand editing for correctness and appearance.  The prompts I use are included below.

## Data prompt

Generate 30 classic cocktails in a yaml file.

Each cocktail should be described by its name, a brief text description, its primary spirit, the ingredients, and a flavour profile. Prefer cocktails with a primary spirit of gin, vodka, bourbon, rum, tequila, or mezcal. The flavour profile should use one or more of the following words: bitter, spicy, fruity, herbal, smoky, savory, citrusy, creamy, nutty, floral, rich, dry, refreshing, spirit forward.

Here are some examples:

```yaml
- name: Negroni
  description: >
    It's known for its balanced, bitter-sweet flavour profile, making it a staple in the world of aperitifs.
  primary-spirit: Gin
  construction: stirred
  ingredients:
  - [1, oz, gin]
  - [1, oz, sweet vermouth]
  - [1, oz, Campari]
- flavour: [bitter, spirit forward]

- name: Martini
  description: >
    The martini is a symbol of sophistication with a dry, clean flavour.
  primary-spirit: Gin
  construction: stirred
  ingredients:
    - [2.5, oz, gin]
    - [0.5, oz, dry vermouth]
  garnish: lemon twist
  flavour: [dry, spirit forward]

- name: Daiquiri
  description: >
    The Daiquiri is a simple yet elegant cocktail that balances the sweetness of rum with the tartness of lime.
  primary-spirit: Rum
  construction: shaken
  ingredients:
    - [2, oz, white rum]
    - [1, oz, lime juice]
    - [0.75, oz, simple syrup]
  flavour: [citrusy, refreshing]
```

## App prompt

Help my create a shiny app that helps the user select a cocktail to make. The cocktails are stored in yaml, and look like this:

```yaml
- name: Aviation
  description: >
    A classic gin cocktail with a floral and slightly fruity profile, made with maraschino liqueur and crème de violette.
  primary-spirit: Gin
  construction: shaken
  ingredients:
    - [2, oz, gin]
    - [0.5, oz, maraschino liqueur]
    - [0.25, oz, crème de violette]
    - [0.75, oz, lemon juice]
  garnish: cherry
  flavour: [floral, fruity, refreshing]
```

The app should start by showing 3 random cocktails. The user should be able to filter that list by optionally selecting primary spirit, and one or more flavour profiles.

Each cocktail should include a brief description and instructions on how to make it.

Conclude your explanation with a single `app.R` file.
