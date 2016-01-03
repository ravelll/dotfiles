<?php

$finder = Symfony\CS\Finder\DefaultFinder::create()
    ->in(__DIR__);

return Symfony\CS\Config\Config::create()
    ->setRules(array(
        'array_element_white_space_after_comma' => true,
        'array_element_no_space_before_comma'   => true,
        'concat_without_spaces'                 => true,
        'duplicate_semicolon'                   => true,
        'extra_empty_lines'                     => true,
        'method_argument_default_value'         => true,
        'spaces_after_semicolon'                => true,
        'spaces_before_semicolon'               => true,
        'standardize_not_equal'                 => true,
        'ternary_spaces'                        => true,
        'unused_use'                            => true,
        'align_double_arrow'                    => true,
        'short_echo_tag'                        => true,
        '@PSR2'                                 => true
    ))
    ->finder($finder);
