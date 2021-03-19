# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - A User has_many Posts.
    - A User has_many Subscriptions.
    - A User has_many Followers.
    - A User has_many Likes.
    - A User has_many Comments.
    - A Post has_many Likes.
    - A Post has_many Comments.
    - A Group has_many Subscriptions.
    - A Group has_many Posts.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - A Subscription belongs_to a User.
    - A Subscription belongs_to a Group.
    - A Post belongs_to a Group.
    - A Post belongs_to a User.
    - A Follower belongs_to a User.
    - A Like belongs_to a User.
    - A Like belongs_to a Post.
    - A Comment belongs_to a User.
    - A Comment belongs_to a Post.
- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
