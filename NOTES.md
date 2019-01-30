Models::Data
Views::Presentation
Controllers::Logic

CONTROLLER ACTIONS:

CREATE
GET /articles/new #=> new, should present a form to a logged in user for adding new articles
POST /articles #-> create, add a new article for a user to app

RETRIEVE
GET /articles #=> index, list all articles for logged in user
GET /articles/1 #=> show, show logged in user specific article based on its ID

UPDATE
GET /articles/1/edit #=> edit, present a form to logged in user to edit an existing article by ID
PUT /articles/1 #=> update, update article 1

DESTROY
DELETE /articles/1 #=> destroy, should delete article 1

---

USER EXPERIENCE

1. homepage
2. user creates new account or logs in
  - if creating new account, submits form and taken to add articles form
  - if logging in, taken to dashboard
3. user presented with an add articles form (vision: by URL)
4. user adds an article and submits
5. asked if they want to add another
6. if yes, back to form, if no, taken to dashboard with Gmail-style view
7. on dashboard, user can view, edit, delete articles, or click to add more + log out and change profile and password
8. if user logs out, taken to homepage

ROUTES

- dynamic below static
