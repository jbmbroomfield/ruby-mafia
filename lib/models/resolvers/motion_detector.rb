motion_detector = Resolver.new('Motion Detector', 'target', 'inspect', 'detected')

def motion_detector.resolve(action)
    action.result = 'No motion detected'
    action.night.visible_actions.each do |action2|
        break if check_action(action2, action)
    end
end

def motion_detector.check_action(action2, action)
    if action2.player != action.player && [action2.player, action2.target].include?(action.target)
        action.result = 'Motion detected'
        true
    end
end