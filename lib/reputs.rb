require "reputs/version"

Kernel.class_eval do
  def reputs(thing)
    puts thing
    return thing
  end
end
