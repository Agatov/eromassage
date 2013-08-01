# encoding: utf-8
class Program < ActiveRecord::Base
  attr_accessible :description, :duration_cd, :girls_count, :image, :preview_description, :price, :title
  as_enum :duration, one: 1, one_and_half: 2, two: 3, more_then_two: 4
  
  mount_uploader :image, SimpleUploader

  def self.filter args
    return all if args.nil?
    res = where 'price <= ?', args[:price] if args[:price].to_i > 0
    res = res.where 'girls_count == ?', args[:girls_count] if args[:girls_count].to_i > 0 && args[:girls_count].to_i < 4
    res = res.where 'girls_count >= 4' if args[:girls_count].to_i == 4
    res = res.where 'duration_cd == ?', args[:duration_cd] if args[:duration_cd].to_i > 0
    res = all unless args[:price].to_i > 0 && args[:girls_count].to_i > 0 && args[:duration_cd].to_i > 0
    #order 'id DESC'
    res
  end

  def self.girls_count_filter
    a = []
    a << OpenStruct.new(title: 'Одна', value: '1')
    a << OpenStruct.new(title: 'Две', value: '2')
    a << OpenStruct.new(title: 'Три', value: '3')
    a << OpenStruct.new(title: 'Больше трех', value: '4')
  end

  def self.price_filter
    a = []
    a << OpenStruct.new(title: 'До пяти тысяч', value: '5000')
    a << OpenStruct.new(title: 'До десяти тысяч', value: '10000')
    a << OpenStruct.new(title: 'До пятнадцати тысяч', value: '15000')
  end

  def self.duration_filter
    a = []
    durations.each do |duration|
      a << OpenStruct.new(title: I18n.t("programs.duration.#{duration.first}"), value: duration.last)
    end
    a
  end
end
