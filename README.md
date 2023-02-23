# NextChapter Form Builder

Welcome to the NextChapter coding assignment! At NextChapter, we’re all about
improving lawyers’ workflow. One of the most important ways we help lawyers is
to collect and organize data. In other words, we build a lot of forms.

For this assignment, we’d like you to create a tool to build and complete custom
forms. Your submission gives us a chance to see how you’d handle a project
similar to what we do every day at NextChapter. We are looking for clear, simple
code running a basic, clean interface. We expect you to spend 3-4 hours on this
assignment.

# Functional Requirements

## Viewing the Forms

The landing page for this lool should:

- Display a list of all the forms the user has created.
- Show a title for each form.
- Show a link with each form to view any form responses.
- Show a link with each form to submit a new response.
- Contain a button to create a new form.

## Creating a Form

When a user clicks on the button to create a new form they should be brought to
a page (or group of pages) where they can:

- Give the form a title.
- Add fields to the form. Each field must have a label that will display next to
  the field. For simplicity’s sake, assume all fields will take string inputs.

## Submitting a Form Response

When the user follows the link to submit a new form response, they should be
brought to a page that:

- Shows the form title at the top.
- For each field, show the label and an input box.
- Shows a submit button. When the user clicks the submit button, their response
  should be saved in the database for later viewing.

# Viewing Form Responses

When the user follows the link to view form responses, they should be brought to
a page that shows a list of entries for each form response. The entry should
identify each form response, for example using an ID number for the
database. There should be a link associated with each entry that will let the
user see the full response for that entry. The page that shows a full response
should look much like the page to submit a form response, except that instead of
providing input boxes it should show the values from the response.

# Other Notes

- Don't worry about authentication. Assume a non-authenticated experience to
  keep things simple.

- You do not need to go overboard about styling your application. However, the
  interface should be intuitive enough that we do not have trouble performing
  the tasks outlined in the requirements.

# Building and Running Your Application

Please use the sample Ruby on Rails code to get started. It is just a basic
Rails installation – the rest is up to you! We have included a Dockerfile to
help with any build dependencies. The Dockerfile also runs db:migrate so you can
launch your application by starting the container.

We expect to be able to run your finished application by running:

    > docker build -t formbuilder .
    > docker run -p 3000:3000 formbuilder

Note that this will delete the SQLite database whenever you stop the
container. We use this approach because it's a simple to reliably run your code.

Good luck!

-- The NextChapter Team
