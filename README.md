# colors-ruby
Ukládání dat do vzorů Rgb, Lab a Xyz.
Další funkcí je zde, porovnávání barev (rgb) do srovnávacího vzoru [Cie1976](https://en.wikipedia.org/wiki/CIELUV).

![CIE_1976_UCS](/static/256px-CIE_1976_UCS.png "CIE_1976_UCS")
> ### Obrázek CIE_1976_UCS
> (u′, v′) diagram chromatičnosti, také známý jako diagram CIE 1976 UCS.

<!-- > ### Info
> Pomocí **Cie1976** vzoru se transformuje *rgb* do *xyz* a následně do *lab*. -->

### Obsah
- [1 Příklady](#1-příklady)
  - [1.1 Kód](#11-kód)
  - [1.2 Projekt](#12-projekt)

## 1 Příklady
Pro lepší vysvětliní zde uvedu pár příkladů.

## 1.1 Kód
Aplikace která porovnává dvě barvy v uloženém vzoru *rgb*, přes *Cie1976::compare*.
Výsledkem bude reálné číslo. Čím nižší číslo je, tím je více relevantnější.
Pokud reálné číslo bude nad 50.0 hodnotou, tak je náznakem velké odlišnosti.

```ruby
require "./lib/colors"

module App
  def App.compare a, b
    Colors::Comparisons::Cie1976::compare(a, b)
  end

  juice = Colors::Conversions::Rgb.new(244, 159, 36)
  tomorrow = Colors::Conversions::Rgb.new(240, 140, 72)
  p compare(juice, tomorrow)
end

#=> 21.44137019477308
```

## 1.2 Projekt
Porovnávání barev je třeba dobré u produktů, které jsou vyznačeny barvou.
Příkladem jsou spreje od [Montana Cans](https://www.montana-cans.com/en/spray-cans/montana-spray-paint/black-50ml-600ml-graffiti-paint/montana-black-400ml?number=321337), kde mají velkou různorodost barev k výběru.

Aby se lépe člověk orientoval, tak pomocí api porovnáme tyto spreje.
- Api aplikaci naleznete [zde](https://montana-api.herokuapp.com/api/v1/color/juice).

![api_montana_cans](/static/api_montana_cans.png "api_montana_cans")
> ### Obrázek api_montana_cans
> Nalezená relevantnost barev. (Od *Juice* barvy.)
