function AxesForPrTargetingPlotter(app)
    app.distanceDistributionPlottingAxes = plot(app.AxesForPrTargeting,...
                                            app.rawDistanceDistribution(:, 1, app.numberOfTimesPrLoadingButtonHit),...
                                            app.rawDistanceDistribution(:, 2, app.numberOfTimesPrLoadingButtonHit)/...
                                            max(app.rawDistanceDistribution(:, 2, app.numberOfTimesPrLoadingButtonHit)),...
                                            'linewidth', 3);
    hold(app.AxesForPrTargeting, 'on')
    ylim(app.AxesForPrTargeting,[-0.1 1.1])
    set(app.AxesForPrTargeting,'FontSize',20)
    yticks(app.AxesForPrTargeting,[])
    xlim(app.AxesForPrTargeting,[0 8])
    title(app.AxesForPrTargeting, app.distanceDistributionFullPath(app.numberOfTimesPrLoadingButtonHit), 'Interpreter', 'none', 'FontSize', 8);
end