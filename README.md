
###### Acceptance criteria:

Following [this Figma design](https://www.figma.com/file/iT4JJpx8KFD2F1kjcVaAbK/OWWN-Coding-Challenge), the app should behave as follows:

###### Screen 1 - Authentication
- It is up to you how this page looks.
- The Auth API must be called on this page in order to obtain an access token.
- The user must be directed back to this page if the access token expired. You don't need to implement the refresh token functionality.

###### Screen 2 - Users List
- The app bar at the top should have the ability to scroll and have a parallax effect when the user scrolls up. You can use any image you like.
- The list of users should be grouped by Active and Inactive status as shown in the designs
- Pagination should be supported.
- Each item should display an avatar with the user's name initials, username, and email.

###### Test
You are provided with an empty widget test, but feel free to add any that you may consider useful.

## API details

You can import the JSON file located in the project's root directory into Postman.

Base URL: `https://ccoding.owwn.com/hermes`

There are three endpoints that you must access:

**Auth Endpoint: /auth**
> To begin, you will need your access token, which can be obtained using your ApiKey and your email address.
Credentials:
```
Email: flutter-challenge@owwn.com
API Key: owwn-challenge-22bbdk
```
```
Header: X-API-KEY
Body
{
   "email": "youremail@email.com"
}
Response:
{
   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTU5Nzg1NTcsImlkZW50aXR5IjoiNTg3NTE0ODMtODE4ZS00YWVjLWI0YmYtZWMwZjFiODkyNWI1IiwidmFyaWV0eSI6IkFVVEgifQ.5EWR34YJOJPxRBQh7np12woSZZJ8ERcsD_BEkrWkMFM",
   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTU5Nzg4NTcsImlkZW50aXR5IjoiNTg3NTE0ODMtODE4ZS00YWVjLWI0YmYtZWMwZjFiODkyNWI1IiwidmFyaWV0eSI6IlJFRlJFU0hfQVVUSCJ9.curbnireZmH9zcTTUYr7VVkQa-CLOWuf7JKKW7Av_hY"
}
```
**Users List Endpoint: /users?limit=10&page=1**

> Then, you’ll need to pass your Access Token as the Authentication header, and the endpoint accepts 2 query parameters for pagination purposes: limit and page.
Response: (Fields marked with * are optional)
```
{
   "users": [
       {
           "id": "f66f258d-8047-42ef-96e0-94df79f36474",
           "name": "Kenneth Harper",
           "gender": "male",
           "status": "active",
          *"email": "kenneth.harper@gmail.com",
           "partner_id": "58751483-818e-4aec-b4bf-ec0f1b8925b5",
           "created_at": "2022-06-23T11:56:17.887865+02:00",
          *"statistics": [12,196]
       }
   ],
   "total": 121
}
