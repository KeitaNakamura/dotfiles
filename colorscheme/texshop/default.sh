#!/bin/sh
# restore the default settings that come with TeXShop
# ref https://github.com/altercation/solarized/issues/167


defaults write TeXShop background_R 1.0
defaults write TeXShop background_G 1.0
defaults write TeXShop background_B 1.0

defaults write TeXShop commandred 0.0
defaults write TeXShop commandgreen 0.0
defaults write TeXShop commandblue 1.0

defaults write TeXShop commentred 1.0
defaults write TeXShop commentgreen 0.0
defaults write TeXShop commentblue 0.0

defaults write TeXShop foreground_R 0.00
defaults write TeXShop foreground_G 0.00
defaults write TeXShop foreground_B 0.00

defaults write TeXShop indexred 1.00
defaults write TeXShop indexgreen 1.00
defaults write TeXShop indexblue 0.00

defaults write TeXShop insertionpoint_R 0.00
defaults write TeXShop insertionpoint_G 0.00
defaults write TeXShop insertionpoint_B 0.00

defaults write TeXShop markerred 0.02
defaults write TeXShop markergreen 0.51
defaults write TeXShop markerblue 0.13
