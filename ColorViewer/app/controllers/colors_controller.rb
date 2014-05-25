class ColorsController < UIViewController
  def viewDidLoad
    super

    self.title = "Colors"
    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Colors"
    @label.sizeToFit
    @label.center = [self.view.size.width / 2, self.view.size.height / 2]
    @label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    self.view.addSubview(@label)

    ["red", "yellow", "blue"].each_with_index do |color_text, index|
      color = UIColor.send("#{color_text}Color")
      button_width = 80

      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.setTitle(color_text, forState: UIControlStateNormal)
      button.setTitleColor(color, forState: UIControlStateNormal)
      button.sizeToFit
      button.frame = [[30 + index * (button_width + 10), @label.frame.origin.y + button.frame.size.height + 10], [button_width, button.frame.size.height]]
      button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
      button.addTarget(self, action: "#{color_text}_tapped", forControlEvents: UIControlEventTouchUpInside)

      self.view.addSubview(button)
    end
  end

  def red_tapped
    controller = ColorDetailController.alloc.initWithColor(UIColor.redColor)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def yellow_tapped
    controller = ColorDetailController.alloc.initWithColor(UIColor.yellowColor)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def blue_tapped
    controller = ColorDetailController.alloc.initWithColor(UIColor.blueColor)
    self.navigationController.pushViewController(controller, animated: true)
  end
end
