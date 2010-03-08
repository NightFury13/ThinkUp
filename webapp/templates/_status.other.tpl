{if $smarty.foreach.foo.first}
	<div class="header clearfix"> 
	    <div class="grid_2 alpha">&nbsp;</div>
        <div class="grid_3 right">name</div> 
        <div class="grid_3 right">followers</div>
        <div class="grid_3 right">date</div>
        <div class="grid_11 omega">post</div> 
    </div> 
{/if}

<div class="individual-tweet clearfix{if $t->is_protected} private{/if}{if $t->in_reply_to_status_id} reply{/if}">
    <div class="grid_2 alpha">
		<a href="{$cfg->site_root_path}user/?u={$t->author_username}&i={$i->twitter_username}"><img src="{$t->author_avatar}" class="avatar"></a>
    </div>
	<div class="grid_3 right small">
		<a href="{$cfg->site_root_path}user/?u={$t->author_username}&i={$i->twitter_username}">{$t->author_username}</a>
    </div>
    <div class="grid_3 right small">
		{$t->author->follower_count|number_format}
	</div>
	<div class="grid_3 right small">
        <a href="{$cfg->site_root_path}status/?t={$t->status_id}">{$t->adj_pub_date|relative_datetime}</a>
	</div>

	<div class="grid_11 omega">
		
    	<div class="tweet-body">
    		{if $t->link->is_image}<a href="{$t->link->url}"><img src="{$t->link->expanded_url}" style="float:right;background:#eee;padding:5px" /></a>{/if}
    
    		<p>{$t->tweet_html|regex_replace:"/^@[a-zA-Z0-9_]+/":""|link_usernames}{if $t->in_reply_to_status_id} <a href="{$cfg->site_root_path}status/?t={$t->in_reply_to_status_id}">in reply to</a> {/if}</p>
    		
    		{if $t->author->location}<div class="small gray">Location: {$t->author->location}</div>{/if}
    		
    		{if $t->author->description}<div class="small gray">Description: {$t->author->description}</div>{/if}
            
    		{if $t->link->expanded_url}<ul><li><a href="{$t->link->expanded_url}" title="{$t->link->expanded_url}">{$t->link->title}</a></li></ul>{/if}
    
    
    	</div>
    </div>

</div>

