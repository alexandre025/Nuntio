# encoding : utf-8

MoneyRails.configure do |config|

  config.default_currency = :eur

  config.register_currency = {
    :priority            => 1,
    :iso_code            => "EUR",
    :name                => "Euro",
    :symbol              => " €",
    :symbol_first        => false,
    :subunit             => "cent",
    :subunit_to_unit     => 100,
    :thousands_separator => ".",
    :decimal_mark        => ","
  }

end
