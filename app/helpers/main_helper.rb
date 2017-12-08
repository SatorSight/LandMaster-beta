module MainHelper
  def stars(page)
    res = (page.start*20).to_i
    if res > 100
      res = 100
    end
    res
  end
end