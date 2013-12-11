#!perl -w
use strict;
use Test::More;

use Time::List;
use Time::List::Constant;

$ENV{TZ} = "JST";

subtest 'get_list_array'=> sub {
    my $timelist = Time::List->new(
        input_strftime => '%Y-%m-%d %H:%M:%S',
        output_strftime => '%Y-%m-%d %H:%M:%S',
        time_unit => DAY ,
        output_type => HASH ,
    );

    my ($start_time , $end_time , $hash );

    $start_time = "2013-01-01 00:00:00";
    $end_time = "2013-01-10 00:00:00";
    $hash = $timelist->get_list($start_time , $end_time);
    is_deeply {
        "2013-01-01 00:00:00" => {},
        "2013-01-02 00:00:00" => {},
        "2013-01-03 00:00:00" => {},
        "2013-01-04 00:00:00" => {},
        "2013-01-05 00:00:00" => {},
        "2013-01-06 00:00:00" => {},
        "2013-01-07 00:00:00" => {},
        "2013-01-08 00:00:00" => {},
        "2013-01-09 00:00:00" => {},
        "2013-01-10 00:00:00" => {},
    } , $hash;

    $start_time = "2013-01-01 00:00:01";
    $end_time = "2013-01-10 00:00:00";
    $hash = $timelist->get_list($start_time , $end_time);
    is_deeply {
        "2013-01-02 00:00:00" => {},
        "2013-01-03 00:00:00" => {},
        "2013-01-04 00:00:00" => {},
        "2013-01-05 00:00:00" => {},
        "2013-01-06 00:00:00" => {},
        "2013-01-07 00:00:00" => {},
        "2013-01-08 00:00:00" => {},
        "2013-01-09 00:00:00" => {},
        "2013-01-10 00:00:00" => {},
    } , $hash;

    $start_time = "2013-01-01 00:00:00";
    $end_time = "2013-01-02 00:00:00";
    $timelist->time_unit(HOUR);
    $hash = $timelist->get_list($start_time , $end_time);

    is_deeply {
        "2013-01-01 00:00:00" => {},
        "2013-01-01 01:00:00" => {},
        "2013-01-01 02:00:00" => {},
        "2013-01-01 03:00:00" => {},
        "2013-01-01 04:00:00" => {},
        "2013-01-01 05:00:00" => {},
        "2013-01-01 06:00:00" => {},
        "2013-01-01 07:00:00" => {},
        "2013-01-01 08:00:00" => {},
        "2013-01-01 09:00:00" => {},
        "2013-01-01 10:00:00" => {},
        "2013-01-01 11:00:00" => {},
        "2013-01-01 12:00:00" => {},
        "2013-01-01 13:00:00" => {},
        "2013-01-01 14:00:00" => {},
        "2013-01-01 15:00:00" => {},
        "2013-01-01 16:00:00" => {},
        "2013-01-01 17:00:00" => {},
        "2013-01-01 18:00:00" => {},
        "2013-01-01 19:00:00" => {},
        "2013-01-01 20:00:00" => {},
        "2013-01-01 21:00:00" => {},
        "2013-01-01 22:00:00" => {},
        "2013-01-01 23:00:00" => {},
        "2013-01-02 00:00:00" => {},
    } , $hash;

    $start_time = "2013-01-01 00:00:01";
    $end_time = "2013-01-02 00:00:00";
    $timelist->time_unit(HOUR);
    $hash = $timelist->get_list($start_time , $end_time);

    is_deeply {
        "2013-01-01 01:00:00" => {} ,
        "2013-01-01 02:00:00" => {} ,
        "2013-01-01 03:00:00" => {} ,
        "2013-01-01 04:00:00" => {} ,
        "2013-01-01 05:00:00" => {} ,
        "2013-01-01 06:00:00" => {} ,
        "2013-01-01 07:00:00" => {} ,
        "2013-01-01 08:00:00" => {} ,
        "2013-01-01 09:00:00" => {} ,
        "2013-01-01 10:00:00" => {} ,
        "2013-01-01 11:00:00" => {} ,
        "2013-01-01 12:00:00" => {} ,
        "2013-01-01 13:00:00" => {} ,
        "2013-01-01 14:00:00" => {} ,
        "2013-01-01 15:00:00" => {} ,
        "2013-01-01 16:00:00" => {} ,
        "2013-01-01 17:00:00" => {} ,
        "2013-01-01 18:00:00" => {} ,
        "2013-01-01 19:00:00" => {} ,
        "2013-01-01 20:00:00" => {} ,
        "2013-01-01 21:00:00" => {} ,
        "2013-01-01 22:00:00" => {} ,
        "2013-01-01 23:00:00" => {} ,
        "2013-01-02 00:00:00" => {} ,
    } , $hash;

    done_testing;
};

subtest 'get_list_array_with_endtime'=> sub {
    my $timelist = Time::List->new(
        input_strftime => '%Y-%m-%d %H:%M:%S',
        output_strftime => '%Y-%m-%d %H:%M:%S',
        time_unit => DAY ,
        output_type => HASH,
        show_end_time => 1 ,
    );

    my ($start_time , $end_time , $hash );

    $start_time = "2013-01-01 00:00:00";
    $end_time = "2013-01-10 00:00:00";
    $hash = $timelist->get_list($start_time , $end_time);
    is_deeply {
        "2013-01-01 00:00:00~2013-01-01 23:59:59" => {} ,
        "2013-01-02 00:00:00~2013-01-02 23:59:59" => {} ,
        "2013-01-03 00:00:00~2013-01-03 23:59:59" => {} ,
        "2013-01-04 00:00:00~2013-01-04 23:59:59" => {} ,
        "2013-01-05 00:00:00~2013-01-05 23:59:59" => {} ,
        "2013-01-06 00:00:00~2013-01-06 23:59:59" => {} ,
        "2013-01-07 00:00:00~2013-01-07 23:59:59" => {} ,
        "2013-01-08 00:00:00~2013-01-08 23:59:59" => {} ,
        "2013-01-09 00:00:00~2013-01-09 23:59:59" => {} ,
        "2013-01-10 00:00:00~2013-01-10 23:59:59" => {} ,
    } , $hash;

    $start_time = "2013-01-01 00:00:00";
    $end_time = "2013-01-10 00:00:00";
    $timelist->end_time_separate_chars(" :: ");
    $hash = $timelist->get_list($start_time , $end_time);
    is_deeply {
        "2013-01-01 00:00:00 :: 2013-01-01 23:59:59" => {} ,
        "2013-01-02 00:00:00 :: 2013-01-02 23:59:59" => {} ,
        "2013-01-03 00:00:00 :: 2013-01-03 23:59:59" => {} ,
        "2013-01-04 00:00:00 :: 2013-01-04 23:59:59" => {} ,
        "2013-01-05 00:00:00 :: 2013-01-05 23:59:59" => {} ,
        "2013-01-06 00:00:00 :: 2013-01-06 23:59:59" => {} ,
        "2013-01-07 00:00:00 :: 2013-01-07 23:59:59" => {} ,
        "2013-01-08 00:00:00 :: 2013-01-08 23:59:59" => {} ,
        "2013-01-09 00:00:00 :: 2013-01-09 23:59:59" => {} ,
        "2013-01-10 00:00:00 :: 2013-01-10 23:59:59" => {} ,
    } , $hash;

};


done_testing;
