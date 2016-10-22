//
//  PersonTableViewCell.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "Person.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface PersonTableViewCell ()

@property(nonatomic, weak) UIImageView *avatarImageView;
@property(nonatomic, weak) UILabel *nameLabel;

@end

@implementation PersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    [self setupCell];
    [self setupConstraints];
    
    return self;
}

- (void)setupCell {
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:avatarImageView];
    self.avatarImageView = avatarImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
//    nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
}

- (void)setupConstraints {
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(self.separatorInset.left);
        make.height.equalTo(self.avatarImageView.mas_width);
        make.top.and.bottom.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(6, 0, 6, 0));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).with.offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

- (void)setPerson:(Person *)person {
    if (_person != person) {
        _person = person;
        
        [self updateContent];
    }
}

- (void)updateContent {
    self.nameLabel.text = self.person.name;
    [self.avatarImageView sd_setImageWithURL:self.person.avatarURL];
}

@end
