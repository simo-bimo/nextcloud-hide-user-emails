<h1 align="center">
  <br>hide-user-emails
</h1>
<h3 align="center">
  A Nextcloud app that hides user emails in the interface. NOTE: This app does not actually remove emails from any indexing, it just hides them in the interface so they are non-obvious. They can still be found on calendar event invitations and in the page source.
</h3>

# Introduction

This app sets the CSS of every div / span used to display emails as `visibility: hidden;`. This means emails are not shown in the interface, but can be quickly deduced by inspecting page source, or looking at calendar invitations etc.

The goal is to make user emails less *obvious*, so that to find them one must actively seek them out. This means a person should not, through regular usage of the service, discover emails by accident. This should be acceptable for small groups where it is generally known that private emails shouldn't be sought out.

# Contributors

This is a direct fork of the [Nextcloud Unrounded Corners](https://github.com/OliverParoczai/nextcloud-unroundedcorners) app. I have simply changed the particular CSS Used.

- [@simo-bimo](https://github.com/simo-bimo/)
- [@OliverParoczai](https://github.com/OliverParoczai) (from unrounded corners).
- [@karlprieb](https://github.com/karlprieb) (from unrounded corners).

# Issues

If you notice a spot or app where an email can be seen (i.e. by searching for somebody to share with), please let me know and I will attempt to hide it there as well.

# Packaging using the buildscript

There is a bash script for packaging the application included in the 'code' directory. It makes a tar file using the required file structure, and can optionally sign it.

The script doesn't require root permissions, just a few packages: ```git, xmlstarlet, tar```
