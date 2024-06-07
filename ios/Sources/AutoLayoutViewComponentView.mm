#ifdef RCT_NEW_ARCH_ENABLED
#import "AutoLayoutViewComponentView.h"
#import <React/RCTConversions.h>

#import <react/renderer/components/rnflashlist/ComponentDescriptors.h>
#import <react/renderer/components/rnflashlist/EventEmitters.h>
#import <react/renderer/components/rnflashlist/Props.h>
#import <react/renderer/components/rnflashlist/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

#if __has_include(<RNFlashList/RNFlashList-Swift.h>)
#import <RNFlashList/RNFlashList-Swift.h>
#else
#import "RNFlashList-Swift.h"
#endif

using namespace facebook::react;

@interface AutoLayoutViewComponentView () <RCTAutoLayoutViewViewProtocol>
@end

@implementation AutoLayoutViewComponentView
{
    AutoLayoutView *_autoLayoutView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const AutoLayoutViewProps>();
    _props = defaultProps;
    _autoLayoutView = [[AutoLayoutView alloc] initWithFrame:self.bounds];

    self.contentView = _autoLayoutView;
  }

  return self;
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<AutoLayoutViewComponentDescriptor>();
}

- (void)updateProps:(const Props::Shared &)props oldProps:(const Props::Shared &)oldProps
{
    const auto &newProps = *std::static_pointer_cast<const AutoLayoutViewProps>(props);

    [_autoLayoutView setHorizontal:newProps.horizontal];
    [_autoLayoutView setScrollOffset:newProps.scrollOffset];
    [_autoLayoutView setWindowSize:newProps.windowSize];
    [_autoLayoutView setRenderAheadOffset:newProps.renderAheadOffset];
    [_autoLayoutView setEnableInstrumentation:newProps.enableInstrumentation];
    [_autoLayoutView setDisableAutoLayout:newProps.disableAutoLayout];

    [super updateProps:props oldProps:oldProps];
}
@end

Class<RCTComponentViewProtocol> AutoLayoutViewCls(void)
{
  return AutoLayoutViewComponentView.class;
}

#endif /* RCT_NEW_ARCH_ENABLED */
