package org.softwire.training.views;

import io.dropwizard.views.View;
import org.softwire.training.models.user.UserSummary;

import java.nio.charset.StandardCharsets;
import java.util.List;

public class HomePageView extends View {
    private UserSummary loggedInUser;
    private final List<UserSummary> users;

    public HomePageView(UserSummary user, List<UserSummary> users) {
        super("HomePageView.mustache", StandardCharsets.UTF_8);
        this.loggedInUser = user;
        this.users = users;
    }

    public List<UserSummary> getUsers() {
        return users;
    }

    public UserSummary getLoggedInUser() {
        return loggedInUser;
    }
}
