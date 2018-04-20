//
//  AnnotationViewController.m
//  Category_demo
//
//  Created by songjian on 13-3-21.
//  Copyright (c) 2013年 songjian. All rights reserved.
//

#import "AnnotationViewController.h"

enum {
    AnnotationViewControllerAnnotationTypeRed = 0,
    AnnotationViewControllerAnnotationTypeGreen,
    AnnotationViewControllerAnnotationTypePurple
};

@interface AnnotationViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSMutableArray *annotationsControl;
@property (nonatomic) CGPoint mean;
@end

@implementation AnnotationViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initAnnotations];
    [self toneAnnotations];
//    [self pointsFromVariousDevicesAnnotations];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(returnAction)];
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.mapView addAnnotations:self.annotations];
    [self.mapView showAnnotations:self.annotations edgePadding:UIEdgeInsetsMake(200, 100, 200, 200) animated:YES];
    
}

#pragma mark - Action Handlers
- (void)returnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Initialization
- (void)initAnnotations
{
    self.annotations = [NSMutableArray array];
    self.annotationsControl = [NSMutableArray array];
    
    CLLocationCoordinate2D coordinates[20] = {
//        {34.096195, 108.606224},
//        {34.096298, 108.623444},
//        {34.098679, 108.624916},
//        {34.101307, 108.625053},
//        {34.105068, 108.625053},
//        {34.108700, 108.625069},
//        {34.113415, 108.625069},
//        {34.115448, 108.619972},
//        {34.115498, 108.613609},
//        {34.115566, 108.609352},
////
//        {34.097203, 108.601885},
//        {34.098007, 108.618688},
//        {34.100042, 108.620620},
//        {34.102868, 108.620618},
//        {34.106745, 108.620608},
//        {34.110102, 108.620707},
//        {34.115163, 108.620730},
//        {34.117075, 108.615540},
//        {34.117170, 108.609273},
//        {34.117225, 108.605020}
        {34.162228, 108.496376},
        {34.160877, 108.502586},
        {34.161236, 108.508705},
        {34.162651, 108.520592},
        {34.163612, 108.528023},
        {34.167755, 108.540520},
        {34.173122, 108.546356},
        {34.177711, 108.563454},
        {34.175339, 108.563782},
        {34.170959, 108.559059},
        //
        {34.163578, 108.492153},
        {34.162268, 108.498192},
        {34.162728, 108.504315},
        {34.164220, 108.516148},
        {34.165168, 108.523402},
        {34.169430, 108.536543},
        {34.174760, 108.542013},
        {34.179373, 108.559037},
        {34.176775, 108.559460},
        {34.172768, 108.554482}
    };
    
    NSMutableArray *avriance = [NSMutableArray array];
    CGPoint mean = CGPointMake(0, 0);
    for (int i = 0; i< 10; i++) {
        [avriance addObject:[NSValue valueWithCGPoint:CGPointMake(coordinates[i].latitude - coordinates[i+10].latitude, coordinates[i].longitude - coordinates[i+10].longitude)]];
        mean.x += coordinates[i].latitude - coordinates[i+10].latitude;
        mean.y += coordinates[i].longitude - coordinates[i+10].longitude;
        NSLog(@"x %f, y %f",coordinates[i].latitude - coordinates[i+10].latitude,coordinates[i].longitude - coordinates[i+10].longitude);
    }
    mean.x = mean.x / 10.0000 - 0.000050;
    mean.y = mean.y / 10.0000 - 0.000003;
    
//    mean1.x = roundf(mean.x*100000)/100000.0;
//    mean1.y = roundf(mean.y*100000)/100000.0;
    
    self.mean = mean;
    
}

#pragma mark - Initialization
- (void)toneAnnotations
{
    self.annotations = [NSMutableArray array];
//    {34.117340, 108.599722},
//    {34.125102, 108.599690},
//    {34.135002, 108.593723},
//    {34.140942, 108.586497},
//    {34.145323, 108.580237},
//    {34.147083, 108.577292},
//    {34.150907, 108.571043},
//    {34.153465, 108.566013},
//    {34.158540, 108.562393},
//    {34.167690, 108.556307},
    CLLocationCoordinate2D coordinates[20] = {
        //
//            {34.117225, 108.605020},
//            {34.117340, 108.599722},
//            {34.125102, 108.599690},
//            {34.135002, 108.593723},
//            {34.140942, 108.586497},
//            {34.145323, 108.580237},
//            {34.147083, 108.577292},
//            {34.150907, 108.571043},
//            {34.153465, 108.566013},
//            {34.158540, 108.562393},
//
//        {34.115566 - self.mean.x, 108.609352 - self.mean.y},
//        {34.115536 - self.mean.x, 108.604118 - self.mean.y},
//        {34.123386 - self.mean.x, 108.604088 - self.mean.y},
//        {34.133411 - self.mean.x, 108.598045 - self.mean.y},
//        {34.139278 - self.mean.x, 108.590874 - self.mean.y},
//        {34.143639 - self.mean.x, 108.584663 - self.mean.y},
//        {34.145573 - self.mean.x, 108.581444 - self.mean.y},
//        {34.149155 - self.mean.x, 108.575562 - self.mean.y},
//        {34.151775 - self.mean.x, 108.570473 - self.mean.y},
//        {34.156834 - self.mean.x, 108.565613 - self.mean.y}
        {34.097780, 108.601640},
        {34.102973, 108.620590},
        {34.106747, 108.620557},
        {34.110075, 108.620657},
        {34.115235, 108.620692},
        {34.117060, 108.615355},
        {34.117155, 108.609305},
        {34.117207, 108.604892},
        {34.117307, 108.599772},
        {34.125130, 108.599655},
        
        {34.096123 - self.mean.x, 108.606232 - self.mean.y},
        {34.101292 - self.mean.x, 108.625069 - self.mean.y},
        {34.105080 - self.mean.x, 108.625092 - self.mean.y},
        {34.108513 - self.mean.x, 108.625099 - self.mean.y},
        {34.113586 - self.mean.x, 108.625214 - self.mean.y},
        {34.115364 - self.mean.x, 108.619820 - self.mean.y},
        {34.115532 - self.mean.x, 108.613686 - self.mean.y},
        {34.115620 - self.mean.x, 108.609352 - self.mean.y},
        {34.115582 - self.mean.x, 108.604225 - self.mean.y},
        {34.123459 - self.mean.x, 108.604218 - self.mean.y}
    };
    
    for (int i = 0; i < 20; ++i)
    {
        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
        a1.coordinate = coordinates[i];
        
        a1.title      = [NSString stringWithFormat:@"%d", i];
        [self.annotations addObject:a1];
        
    }
    
}

- (void)pointsFromVariousDevicesAnnotations
{
    self.annotations = [NSMutableArray array];

    CLLocationCoordinate2D coordinates[20] = {

        {34.097203, 108.601885},
        {34.097262, 108.601650},
        {34.097263, 108.601892},
        {34.097268, 108.601887},
        {34.097285, 108.601893}
    };
    
    for (int i = 0; i < 5; ++i)
    {
        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
        a1.coordinate = coordinates[i];
        
        a1.title      = [NSString stringWithFormat:@"%d", i];
        [self.annotations addObject:a1];
        
    }
    
}

#pragma mark - Map Delegate

/*!
 @brief 根据anntation生成对应的View
 @param mapView 地图View
 @param annotation 指定的标注
 @return 生成的标注View
 */
- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        annotationView.canShowCallout               = YES;
        annotationView.animatesDrop                 = YES;
//        annotationView.draggable                    = YES;
        annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        NSInteger title = annotation.title.integerValue;
        annotationView.pinColor                     = title / 10;
        
        return annotationView;
    }
    
    return nil;
}

/*!
 @brief 当mapView新添加annotation views时调用此接口
 @param mapView 地图View
 @param views 新添加的annotation views
 */
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    
}

/*!
 @brief 当选中一个annotation views时调用此接口
 @param mapView 地图View
 @param views 选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    
}

/*!
 @brief 当取消选中一个annotation views时调用此接口
 @param mapView 地图View
 @param views 取消选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view {
    
}

/*!
 @brief 标注view的accessory view(必须继承自UIControl)被点击时调用此接口
 @param mapView 地图View
 @param annotationView callout所属的标注view
 @param control 对应的control
 */
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
}

/**
 *  标注view的calloutview整体点击时调用此接口
 *
 *  @param mapView 地图的view
 *  @param view calloutView所属的annotationView
 */
- (void)mapView:(MAMapView *)mapView didAnnotationViewCalloutTapped:(MAAnnotationView *)view {
    
}

/*!
 @brief 拖动annotation view时view的状态变化，ios3.2以后支持
 @param mapView 地图View
 @param view annotation view
 @param newState 新状态
 @param oldState 旧状态
 */
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view didChangeDragState:(MAAnnotationViewDragState)newState fromOldState:(MAAnnotationViewDragState)oldState {
    
}


@end
