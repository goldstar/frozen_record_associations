# FrozenRecord Associations

Associations extension for FrozenRecord 

## Installation

Add this line to your application's Gemfile:

    gem "frozen_record_associations"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frozen_record_associations

## ActiveRecord Associations

ActiveRecord models can be associated with FrozenRecord models by including the `FrozenRecord::Associations` module.

Two types of associations are supported:
- `belongs_to_frozen`
- `belongs_to_many_frozen`

### The belongs_to_frozen Association

A `belongs_to_frozen` association is similar to `ActiveRecord.belongs_to`. For example, if your application includes authors and books, where authors are Frozen Records, you'd declare the book model this way:

```ruby
class Book < ApplicationRecord
  include FrozenRecord::Associations

  belongs_to_frozen :author
end
```

By default, the Book model would be expected to respond to `#author_id` with a value that matches an Author record's `#id` attribute.

The `belongs_to_frozen` association supports these options:

- `:class_name`
- `:foreign_key`
- `:primary_key`

#### :class_name

If the name of the FrozenRecord model cannot be derived from the association name, you can use the :class_name option to supply the model name.

#### :foreign_key

By convention, it is assumed that the column used to hold the foreign key on this model is the name of the association with the suffix _id added. The :foreign_key option lets you set the name of the foreign key directly.

#### :primary_key

By convention, it is assumed that the id attribute is used to hold the primary key of frozen records. The :primary_key option allows you to specify a different attribute.

### The belongs_to_many_frozen Association

A `belongs_to_many_frozen` association is like a `belongs_to_frozen` association, but for a collection. For example, if your application includes genres and books, where genres are Frozen Records, you'd declare the book model this way:

```ruby
class Book < ApplicationRecord
  include FrozenRecord::Associations

  belongs_to_many_frozen :genres
end
```

By default, the Book model would be expected to respond to `#genre_ids` with an array of values that match Author records' `#id` attribute. If your database supports arrays (e.g PostgreSQL), you could accomplish this with an array column named `genre_ids`.

The `belongs_to_many_frozen` association supports the same options as `belongs_to_frozen`.
