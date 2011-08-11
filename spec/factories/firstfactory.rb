Factory.define :f_article, :class => Article do |a|
  a.id 1
  a.title                  "My first article"
  a.description                 "This is my first article!!!!!!!!"
  a.blog_id 1

end
Factory.define :s_article, :class => Article do |a|
  a.id 2
  a.title                  ""
  a.description                 "test"
  a.blog_id 1
end
Factory.define :t_article, :class => Article do |a|
  a.id 3
  a.title                  "test"
  a.description                 "test"
  a.blog_id 1
end

Factory.define :f_category, :class => Category do |c|
  c.id 1
  c.name                  "programming"
end
Factory.define :s_category, :class => Category do |c|
  c.id 2
  c.name                  "diary"
end

Factory.define :two_categories_article, :class => Article do |a|
  a.id 4
  a.title "My third article"
  a.description "This is my third article!!!!!!!!"
  a.categories {[Factory(:f_category), Factory(:s_category)]}
end

Factory.define :myblog, :class => Blog do |b|
  b.id 1
  b.mail "test@sample.com"
  b.password "test"
  b.password_confirmation "test"
  b.title "simple Blog"
end

Factory.define :miss_pass_conf, :class => Blog do |b|
  b.mail "test@sample.com"
  b.password "text"
  b.password_confirmation "test"
  b.title "sample Blog"
end
