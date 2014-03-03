Picturama-ui
============

This is the UI client for [picturama](https://github.com/aboyon/pictorama) gem. Do you want to see a demo before continue? great! just [click here](http://picturama.davidsilveira.me)

# Installation

It's easy, you just need to clone this repo.

```ruby
git clone git@github.com:aboyon/picturama-ui.git
```
### Configure your settings...

Copy the config.sample.yml to config.yml (into the config/ file)

```ruby
cd config/
cp config.sample.yml config.yml
```
and then proceed to adjust the settings

```yaml
picturama:
  album_source: '/home/user/Pictures/some_folder/'
  allowed_formats: ['jpg','png','jpeg']
  thumbnail_prefix: thumb_
  thumnail_default_size: "200x200"
```

generate your thumbnails quickly, by using the rake task created for that
```
rake thumbnail:generate["/some/folder"] #you can specify a different folder...
```
and then you'll get an answer like this:
```
Generating 30 thumbnails for folder /some/folder/ ...
Size: 200x200
Thumbnail generated from source 1.JPG. Target destination thumb_1.JPG
Thumbnail generated from source 2.JPG. Target destination thumb_2.JPG
```

# Built with...

* [Twitter bootstrap 3.1.1](http://getbootstrap.com/)
* [Sinatra 1.4.2](http://www.sinatrarb.com/)
* [Haml](http://haml.info/)
* [Picturama](https://github.com/aboyon/pictorama)
* [Sinatra R18n 1.1.3](https://github.com/ai/r18n/tree/master/sinatra-r18n)

# License

Please [see licence file](https://github.com/aboyon/pictorama-ui/blob/master/LICENCE) for further reading.