# A Virtual Machine for Ruby on Rails

## Introduction

This project automates the setup of a development environment for working with Ruby on Rails. Use this virtual machine to work on a pull request with everything ready to hack and run the test suites.

## Requirements

* [VirtualBox](https://www.virtualbox.org) or [VMWare Fusion](http://www.vmware.com/products/fusion) or [Parallels Desktop](http://www.parallels.com/products/desktop/)(need Vagrant 1.5+, see [vagrant-parallels](http://parallels.github.io/vagrant-parallels/docs/installation/index.html))

* [Vagrant 1.1+](http://vagrantup.com) (not a Ruby gem)

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/rails-decal/rails-dev-box.git
    host $ cd rails-dev-box
    host $ vagrant up

That's it.

(If you want to use VMWare Fusion instead of VirtualBox, write `vagrant up --provider=vmware_fusion` instead of `vagrant up` when building the VM for the first time. After that, Vagrant will remember your provider choice, and you won't need to include the `provider` flag again.)

(If you want to use Parallels Desktop instead of VirtualBox, you need Vagrant 1.5+, and write `vagrant up --provider=parallels` instead of `vagrant up` when building the VM for the first time. After that, Vagrant will remember your provider choice, and you won't need to include the `provider` flag again.)

If the base box is not present that command fetches it first. The setup itself takes about 3 minutes in my MacBook Air. After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)
    ...
    vagrant@rails-dev-box:~$

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer.

## What's In The Box

* Git

* RVM

* Ruby 2.1.1 (binary RVM install)

* Bundler

* SQLite3, MySQL, and Postgres

* System dependencies for nokogiri, sqlite3, mysql, mysql2, and pg

* Databases and users needed to run the Active Record test suite

* Node.js for the asset pipeline

* Memcached

## Recommended Workflow

The recommended workflow is

* edit in the host computer and

* test within the virtual machine.

Just clone your Rails fork into the rails-dev-box directory on the host computer:

    host $ ls
    README.md   Vagrantfile puppet
    host $ git clone git@github.com:<your username>/rails.git

Vagrant mounts that directory as _/vagrant_ within the virtual machine:

    vagrant@rails-dev-box:~$ ls /vagrant
    puppet  rails  README.md  Vagrantfile

Install gem dependencies in there:

    vagrant@rails-dev-box:~$ cd /vagrant/rails
    vagrant@rails-dev-box:/vagrant/rails$ bundle

We are ready to go to edit in the host, and test in the virtual machine.

This workflow is convenient because in the host computer you normally have your editor of choice fine-tuned, Git configured, and SSH keys in place.

## Virtual Machine Management

When done just log out with `^D` and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://docs.vagrantup.com/v2/) for more information on Vagrant.

## Faster Rails test suites

The default mechanism for sharing folders is convenient and works out the box in
all Vagrant versions, but there are a couple of alternatives that are more
performant.

### rsync

Vagrant 1.5 implements a [sharing mechanism based on rsync](https://www.vagrantup.com/blog/feature-preview-vagrant-1-5-rsync.html)
that dramatically improves read/write because files are actually stored in the
guest. Just throw

    config.vm.synced_folder '.', '/vagrant', type: 'rsync'

to the _Vagrantfile_ and either rsync manually with

    vagrant rsync

or run

    vagrant rsync-auto

for automatic syncs. See the post linked above for details.

### NFS

If you're using Mac OS X or Linux you can increase the speed of Rails test suites with Vagrant's NFS synced folders.

With a NFS server installed (already installed on Mac OS X), add the following to the Vagrantfile:

    config.vm.synced_folder '.', '/vagrant', type: 'nfs'
    config.vm.network 'private_network', ip: '192.168.50.4' # ensure this is available

Then

    host $ vagrant up

Please check the Vagrant documentation on [NFS synced folders](http://docs.vagrantup.com/v2/synced-folders/nfs.html) for more information.

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Ruby on Rails Decal.

## Credits
Based on https://github.com/rails/rails-dev-box
=======
# Instructions

This rails app is meant to help people get a feel for basic static pages.  The
readme contains the instructions.  If there are bugs or comments feel free to
leave an issue on this repo or ask on Piazza.

This lab is to get you started in learning Static Pages.  Between each change you should refresh your browser to observe changes.  If that doesn't work try restarting the server.
Google is also your best friend.  Also there is a few questions on the form to answer.  This is due at the beginning of the next class.

## Starting with Routing:
  When you first run the rails server command we get the general rails page.  However if we look
  around our app there is already a view for the static page that corresponds to home (app/views/pages/home.html.erb).
  Our first job is to make that our home page!  If you get stuck refer to the lecture slides
  or look at Rails Routing guide.  Remember what we need to do to get from the request to getting back the view
  to our browser.

## Updating the Landing Page:
  First let's personalize the landing page a little.  On line 10 there is the line:
  ```
  <a class="navbar-brand" href="/">Start Bootstrap</a>
  ```
  This is an a tag, which signifies it is a link.  Class signifies the css class or
  classes it has and href is where it actually linkes to.
  Let's rebrand it from Start Bootstrap to something fun.  Replace it with anything
  you want.  If you can't figure out what to put just go with the name of your favorite
  book. In lines 37 and 38 there are the lines:
  ```
    <h1>Your Landing Page</h1>
    <h3> A template for the Rails Decal Lab</h3>
  ```
  These h1 and h3 tags signifies headers.  They contain the text that appears on your
  banner.  Update these to something fun as well.


## Your favorite Animal:
  Did you notice that little cat at the bottom of the page?  Well since it is your page you should update
  it to your favorite animal.  First let's find the h2 tag in the Home page and change the contents of it
  to your favorite animal.  In the p tag right below it explain why it is.

  Now let's look at the image tag below it:
  ```
    <img class="img-responsive" src="http://confrazzled.com/wp-content/uploads/2014/08/cat2.jpg" alt="">
  ```
  If we look at this tag it seems like we are getting the cat image from
    http://confrazzled.com/wp-content/uploads/2014/08/cat2.jpg
  Let's change the image by finding the image of your favorite animal.  Refresh your page to see if it
  worked.

## Your About page:
  Currently if you click on the About tab in your nav bar you can't find the page.  Why does that happen when we do    have an in our app/views/pages/about.html.erb?  How can we make it work?

  This about page has no styling.  Change your name on the page!

## Doing some ERB:
  Now we want to fill in our Major and Age (which is blank and 7 respectively).  Let's try and do this
  without changing the HTML and just using our controller WITHOUT editing the html.erb.
  
  Next let's add one more piece of information, your favorite song.  Let's do it using an instance variable in    embedded ruby rather than hardcoding into the html. You MAY add an instance variable into the html, but don't hardcode the song name.

## Adding CSS classes:
  If you look at the app/views/pages/about.html.erb there is an empty image tag at the bottom.
  Add the css class "circular" to it.  What happens?  Can we change this image to another one?  Look at
  app/assets/stylesheets/landing.css.  Scroll to the bottom of the file and see what you find.  Try to
  change this image to an image of yourself?

## Extra (Do this if the homework was way too easy for you):
  Try to refractor the code so that we don't have to repeat the navbar in both the about and the home page.
  Take a look at the layouts folder under views to get a clue on how to do this.

## How to submit
  Run these commands
  ```
  git add .
  git commit -am "Routing"
  ```
  Create a new repository in your Github account called hw1-sp15.  Follow the instructions on how to push up an existing repository then fill out this google doc https://docs.google.com/forms/d/1LWMH3GMYa7ZI4O8_U83pxzLO769TcSCZYrFw7JCSAdY/viewform?usp=send_form

