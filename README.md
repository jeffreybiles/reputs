#Reputs
###return + puts, because it's goddam useful

Let's say you want to debug a one-line function like this:

def so_hat(closet)
  return all_the_radii(closet.hats(&:brim))
end

You want to figure out what exactly you're feeding into all_the_radii, but your first solution fails:

def so_hat(closet)
  return all_the_radii(puts closet.hats(&:brim))
end

It fails because puts returns nil.  You just fed all_the_radii nil.  So terrible!

Your second solution is gross, but it works.

def so_hat(closet)
  puts closet.hats(&:brim)
  return all_the_radii(closet.hats(&:brim))
end

You then want to find out what all_the_radii is returning every time your program runs so_hat.  Remembering that puts returns nil, you write your code like this:

def so_hat(closet)
  puts closet.hats(&:brim)
  puts all_the_radii(closet.hats(&:brim)
  return all_the_radii(closet.hats(&:brim))
end

But then you realize that all_the_radii has side effects.  Specifically, it steals all the radii from the hats, so when you get around to returning it you get a big fat 0.  You gotta fix that, so now your code looks like this:

def so_hat(closet)
  puts closet.hats(&:brim)
  radii = all_the_radii(closet.hats(&:brim))
  puts radii
  return radii
end

Wow, your code sucks!  I'm so glad seppuku is no longer a thing, because now you've lived long enough to realize that

##There's hope!!

This is what your code would look like if you were using reputs:

def so_hat(closet)
  reputs all_the_radii(reputs closet.hats(&:brim))
end

Holy fuck, that's only two words away from what it was originally.  So clear!  So easy!

###Here's what reputs does

def reputs(thing)
  puts thing
  return thing
end

That is literally all, and yet it saved you gourdfuls of code.  Giant gourds.  Please enjoy your newly emptied gourds.