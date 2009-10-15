# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def if_events?
    controller.controller_name == 'events'
  end
  
  def if_items?
    controller.controller_name == 'items'
  end
  
  def if_skate?
    controller.controller_name == 'matches' or controller.controller_name == 'runs'
  end
  
  def if_training?
    controller.controller_name == 'activities'
  end
end
