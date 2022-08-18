# BRAINARY  

    * It is a library management system which can be used by library management system and their users too.
    * It has three user flows: admin, librarian and user

## Registeration :

* Registeration includes inputs like username,email,batch number,mobile,password and confirm password.
* All inputs fields are mandatory
* Username should contain only letters in it with 3 to 15 characters.
* Email should contain @ and . in it which should be in an email format.
* Password has been done with password digest.
* Password should contain minimum 8 characters and maximum 12 characters.
* Confirm Password and Password should be same and equal.
* If these matches correctly the user will be redirected to the main page.
* All the details are stored in the table name "Users".

## LOGIN PAGE

* All the input fields are manadatory to login in the account.
* Email and Password should be registered already in the localstorage if it doesn't match the user is asked to create a account
* Both the fields should match to the details already stored even anyone of the field doesn't match the error will be shown as a message.
* If all the fields are matched correctly the user will be redirected to the main page.
* All the details are stored in local storage.

## PROFILE

###### feature 1 : edit profile

* Users and admin profile can be edited in the profile page.
* To go to profile page click the profile dropdown button and click on the profile button.

### user flow

###### feature 1 : Review adding

* In the user book page there will be a write review button.
* Onclicking the button a popup of review form will be shown where the  users can add reviews.

###### feature 2 : Review display

* The added reviews will be shown in the same page in a scrollable div.

###### feature 3 : Scheduling slot for booking a book:

* The schedule page will contain a calendar in the side div of th page and timings alloted from 9am to 5pm.
* On clicking the respective dates and timings the user need , a form will appear in the same side div where calendar appears.
* On filling the form a user can book a book on their desire dates and timings.

###### feature 4 : Schedule display

* The scheduled book timings will be displayed in the respective timings.

###### feature 5 : Donate books

* The user will be able to donate books in the donate page by filling the donate book form which needs address and mobile to contact the donator.

###### feature 6 : Suggest books

* The user will also be able to suggest the book name or author name they like.

### admin flow
   
###### feature 1 : Book adding

* On clicking the book link on the navbar the admin will be redirected to the book page of admin
* There will be plus button , onclicking the button a popup form for book adding will appear.
* Admin should given all the fields to add a button.

###### feature 2 : Book listing

* The added books will be shown in the admin book page.
* Each records available will be taken out from book table and shown in book page.

###### feature 3 : Book deleting

* There will be green coloured delete buttons to delete the book record.
* Onclicking the delete button, the book record will be deleted from the table.

###### feature 4 : Book scheduled records display:

* The book scheduled records will be shown in the admin schedule page.

###### feature 5 : Scheduled records deleting:

* The scheduled book records will be deleted from the table Schedule_Time.

###### feature 6 : Donate Book listing :

* The user donating book records will be shown from the table Donnate_Books

###### feature 7 : Donate Book Deleting : 

* There will be green coloured delete buttons to delete the donate book records.
* Onclicking the delete button, the donate book records will be deleted from the table.

###### feature 8 : Schedule book listing :

* The scheduled books will be also listed in the Donate page of admin.

###### feature 9 : Schedule Book Deleting : 

* There will be green coloured delete buttons to delete the schedule book records.
* Onclicking the delete button, the schedule book records will be deleted from the table.

###### feature 10 : book availability update :
 
* Admin can update whether the book is available or not be clicking the available button displayed in the book list page in each books.