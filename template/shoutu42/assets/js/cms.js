var ShouTu = {
	'Url': document.URL,
	'Title': document.title,
	'Browser': {
		url: document.URL,
		domain: document.domain,
		title: document.title,
		language: (navigator.browserLanguage || navigator.language).toLowerCase(),
		canvas: function() {
			return !!document.createElement("canvas").getContext
		}(),
		useragent: function() {
			var a = navigator.userAgent;
			return {
				mobile: !!a.match(/AppleWebKit.*Mobile.*/),
				ios: !!a.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
				android: -1 < a.indexOf("Android") || -1 < a.indexOf("Linux"),
				iPhone: -1 < a.indexOf("iPhone") || -1 < a.indexOf("Mac"),
				iPad: -1 < a.indexOf("iPad"),
				trident: -1 < a.indexOf("Trident"),
				presto: -1 < a.indexOf("Presto"),
				webKit: -1 < a.indexOf("AppleWebKit"),
				gecko: -1 < a.indexOf("Gecko") && -1 == a.indexOf("KHTML"),
				weixin: -1 < a.indexOf("MicroMessenger")
			}
		}()
	},
	'Cookie': {
		'Set': function(name, value, days) {
			var exp = new Date();
			exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000);
			var arr = document.cookie.match(new RegExp('(^| )' + name + '=([^;]*)(;|$)'));
			document.cookie = name + '=' + escape(value) + ';path=/;expires=' + exp.toUTCString();
		},
		'Get': function(name) {
			var arr = document.cookie.match(new RegExp('(^| )' + name + '=([^;]*)(;|$)'));
			if (arr != null) return unescape(arr[2]);
		},
		'Del': function(name) {
			var exp = new Date();
			exp.setTime(exp.getTime() - 1);
			var cval = this.Get(name);
			if (cval != null) {
				document.cookie = name + "=" + encodeURIComponent(cval) + ";path=/;expires=" + exp
					.toUTCString();
			}
		}
	},
	'Ajax': function(url, type, dataType, data, sfun, efun, cfun) {
		type = type || 'get';
		dataType = dataType || 'json';
		data = data || '';
		efun = efun || '';
		cfun = cfun || '';
		$.ajax({
			url: url,
			type: type,
			dataType: dataType,
			data: data,
			timeout: 5000,
			beforeSend: function(XHR) {},
			error: function(XHR, textStatus, errorThrown) {
				if (efun) efun(XHR, textStatus, errorThrown);
			},
			success: function(data) {
				sfun(data);
			},
			complete: function(XHR, TS) {
				if (cfun) cfun(XHR, TS);
			}
		})
	},
	'Search': {
		'Init': function() {
			$('.search-btn').click(function() {
				if ($('.search-input').val() == '') {
					ShouTu.Other.Toast('请输入搜索关键词！', 1000);
					return false;
				}
			})
		}
	},
	'Copy': {
		'Init': function() {
			$.getScript("/template/shoutu42/assets/js/clipboard.min.js", function() {

				if ($('.share-btn').length > 0) {
					var clipboard = new ClipboardJS('.share-btn');
					clipboard.on('success', function(e) {
						ShouTu.Other.Toast('分享信息复制成功，分享给好朋友一起看～', 1000);
					});
					clipboard.on('error', function(e) {
						console.log(e);
					});
				}
				if ($('.copy').length > 0) {
					var down_clipboard = new ClipboardJS('.copy');
					down_clipboard.on('success', function(e) {
						ShouTu.Other.Toast('下载地址复制成功', 1000);
					});
					down_clipboard.on('error', function(e) {
						console.log(e);
					});
				}
			});
		}
	},
	'Qrcode': {
		'Init': function() {
			$.getScript("/template/shoutu42/assets/js/jquery.qrcode.min.js",
				function() {
					if ($('.qrcode-img').length > 0) {
						$('.qrcode-img').qrcode({
							text: location.href,
							render: "canvas",
							width: 90,
							height: 90,
						});
					}
				});
		},
	},
    'jscode': function() {
                // 懒加载
        $(".lazy").lazyload({
        	effect: "fadeIn",
        	threshold: 200,
        	failure_limit: 10,
        	skip_invisible: false
        });
        
        // 打开搜索框并进入移动视图
        function openSearch() {
        	$(".ac_wd, .search-btn").addClass("search-focus");
        	$(".ac_hot").removeClass("none");
        	$("body").addClass("mobile-open");
        	$(".nav-search").addClass("block");
        }
        
        // 关闭搜索框并退出移动视图
        function closeSearch() {
        	$(".ac_wd, .search-btn").removeClass("search-focus");
        	$(".ac_hot").addClass("none");
        	$("body").removeClass("mobile-open");
        	$(".nav-search").removeClass("block");
        }
        
        // 在输入框和搜索按钮上添加搜索焦点
        $("#txtKeywords, .txtKeywords").focus(openSearch);
        $(".nav-menu-search").click(openSearch);
        
        // 点击搜索区域外时关闭搜索框
        $(document).click(function(e) {
        	if (!$(e.target).closest("#txtKeywords, .search-box, .nav-menu-search, .txtKeywords").length ||
        		$(e.target).closest(".cancel-btn").length) {
        		closeSearch();
        	}
        });
        
        // 滚动时添加背景到头部并移动搜索框
        function checkScroll() {
        	var scrollTop = $(document).scrollTop();
        	$(".header-content").toggleClass("header-bg", scrollTop > 20);
        
        	// 根据滚动位置移动搜索框
        	if (scrollTop > 110) {
        		if (!$(".nav-search form .search-box").length) {
        			$(".nav-search form").append($(".search-box"));
        		}
        	} else {
        		if (!$(".search-main .search-box").length) {
        			$(".search-main").append($(".search-box"));
        		}
        	}
        }
        
        // 初始检查滚动位置
        checkScroll();
        
        // 绑定滚动事件
        $(document).scroll(checkScroll);
        
        
        $(window).scroll(function() {
        	if ($(this).scrollTop() > 500) {
        		$("a.backtop").css("display", "");
        		$(".languagemenu_container").css("bottom", "90px"); // 调整语言菜单的位置
        	} else {
        		$("a.backtop").css("display", "none");
        		$(".languagemenu_container").css("bottom", "55px"); // 恢复语言菜单的位置
        	}
        });
        
        $("a.backtop").click(function(e) {
        	e.preventDefault();
        	$("html, body").animate({
        		scrollTop: 0
        	}, "slow");
        });
        
        // 高亮当前导航项
        $(".nav-menu-items li a").each(function() {
        	if (this.href == document.location.toString().split("#")[0]) {
        		$(this).parent("li").addClass("selected");
        		return false;
        	}
        });
        
        // 选项卡功能
        $(".tab-item").click(function() {
        	var $this = $(this);
        	if (!$this.hasClass("selected")) {
        		var tabIndex = $this.index();
        		$this.addClass("selected").siblings().removeClass("selected");
        		var $moduleMain = $this.closest(".module-main");
        		var $tabLists = $moduleMain.length ? $moduleMain.find(".tab-list") : $(".tab-list");
        		$tabLists.removeClass("selected").eq(tabIndex).addClass("selected").find(
        			".lazyload").lazyload();
        		$(".module-tab-drop").removeClass("module-tab-drop");
        		var $moduleTab = $this.closest(".module-tab");
        		var $moduleTabValue = $moduleTab.length ? $moduleTab.find(".module-tab-value") :
        			$this.parents(".module-tab-items").siblings(".module-tab-name").children(
        				".module-tab-value");
        		$moduleTabValue.text($this.attr("data-dropdown-value"));
        	}
        });
        
        // 打开选项卡下拉菜单
        $(".module-tab .module-tab-name").click(function() {
        	$(this).parent(".module-tab").addClass("module-tab-drop");
        });
        
        // 关闭选项卡下拉菜单
        $(".shortcuts-mobile-overlay, .close-drop").click(function() {
        	$(".module-tab-drop").removeClass("module-tab-drop");
        });
        
        // 初始化导航滑动
        new Swiper('.swiper', {
        	slidesPerView: 'auto',
        	freeMode: true,
        	speed: 500,
        	on: {
        		init: function() {
        			var selectedItem = document.querySelector('.nav-menu-item.selected');
        			if (selectedItem) {
        				var index = Array.from(selectedItem.parentNode.children).indexOf(
        					selectedItem);
        				this.slideTo(index, 500);
        			}
        
        			adjustNavAlignment();
        		},
        		resize: function() {
        			adjustNavAlignment();
        		}
        	}
        });
        
        var swiperbanner = new Swiper('.swiper-container', {
        	direction: 'horizontal',
        	autoplay: {
        		delay: 5000,
        		disableOnInteraction: false,
        	},
        	navigation: {
        		nextEl: '.swiper-button-next',
        		prevEl: '.swiper-button-prev',
        	},
        	pagination: {
        		el: '.swiper-pagination',
        		clickable: false, // 设置为不可点击
        		renderBullet: function(index, className) {
        			var name = document.querySelectorAll('.stui-slide')[index].getAttribute(
        				'data-name');
        			var fname = document.querySelectorAll('.stui-slide')[index].getAttribute(
        				'data-fname');
        			return '<li class="' + className +
        				' swiper-pagination-bullet pagination-item"><div class="focusswiper_nav_slide"><h2>' +
        				name + '</h2><div class="sub_title stui_sub_title">' + fname +
        				'</div></div></li>';
        		}
        	},
        	effect: 'fade',
        	fadeEffect: {
        		crossFade: true,
        	},
        	on: {
        		slideChange: function() {
        			var index = swiperbanner.activeIndex;
        			var bullets = document.querySelectorAll('.swiper-pagination-bullet');
        			bullets.forEach(function(bullet, i) {
        				if (i === index) {
        					bullet.classList.add('swiper-pagination-bullet-active');
        				} else {
        					bullet.classList.remove('swiper-pagination-bullet-active');
        				}
        			});
        		}
        	}
        });
        
        $(document).on('mouseenter', '.swiper-pagination-bullet', function() {
        	var index = $(this).index();
        	swiperbanner.slideTo(index);
        	swiperbanner.autoplay.stop();
        });
        
        $(document).on('mouseleave', '.swiper-pagination-bullet', function() {
        	swiperbanner.autoplay.start();
        });
        
        function adjustNavAlignment() {
        	const navMenuItems = document.querySelector('.nav-menu-items');
        	const swiperWidth = document.querySelector('.nav.swiper').clientWidth;
        	const slidesWidth = Array.from(navMenuItems.children).reduce((total, slide) => {
        		return total + slide.offsetWidth;
        	}, 0);
        
        	if (slidesWidth < swiperWidth) {
        		navMenuItems.style.justifyContent = 'flex-end'; // Align to the right
        	} else {
        		navMenuItems.style.justifyContent = 'flex-start'; // Align to the left
        	}
        }
        
        window.addEventListener('resize', adjustNavAlignment);
        
        // 分类页滑动
        function initializeSwiper() {
        	new Swiper('.category', {
        		slidesPerView: 'auto',
        		freeMode: true,
        		speed: 500,
        		on: {
        			init: function() {
        				var selectedItem = document.querySelector('.block-box-item.selected');
        				if (selectedItem) {
        					var index = Array.from(selectedItem.parentNode.children).indexOf(
        						selectedItem);
        					this.slideTo(index, 500);
        				}
        			}
        		}
        	});
        }
        
        function checkScreenWidth() {
        	if (window.innerWidth <= 768) { // 移动设备阈值（可调整）
        		initializeSwiper();
        	}
        }
        
        // 页面加载时调用 checkScreenWidth
        checkScreenWidth();
        
        // 可选：窗口大小调整时调用 checkScreenWidth
        window.addEventListener('resize', checkScreenWidth);
        
        // 滚动到下载列表
        $('.gotodownloadlist').click(function() {
        	$('html, body').animate({
        		scrollTop: $('#download-list').offset().top
        	}, 800);
        });
        
        // 展开文字功能
        function expandText(selector, maxLength) {
        	$(selector).each(function() {
        		var textElement = $(this);
        		var text = textElement.text();
        		if (text.length > maxLength) {
        			var shortText = text.substr(0, maxLength) + '... ';
        			var moreContent = $('<a class="more-content">全文</a>');
        
        			textElement.text(shortText).append(moreContent);
        
        			moreContent.click(function(event) {
        				event.preventDefault();
        				textElement.text(text);
        				moreContent.remove();
        			});
        		}
        	});
        }
        expandText('.video-info-content', 100);
        
        
        // 集数倒序
        $(".sort-button").click(function() {
        	$(this).toggleClass("desc asc");
        	$($(this).attr("to")).html($($(this).attr("to")).children().get().reverse());
        });
        
        // 获取播放列表第一个节点的信息
        var firstPlayInfoShow = $(".module-tab-item.tab-item").first().data("dropdown-value");
        // 设置播放列表标签内容
        $(".value-play").text(firstPlayInfoShow);
        // 获取下载列表第一个节点的信息
        var firstDownloadInfoShow = $(".downtab-item span").first().data("dropdown-value");
        // 设置下载列表标签内容
        $(".value-down").text(firstDownloadInfoShow);
        
        // 下载列表  
        $(".downtab-item").click(function() {
        	if (!$(this).hasClass("selected")) {
        		$(this).addClass("selected").siblings().removeClass("selected");
        		$(".module-downlist").eq($(this).index()).addClass("selected").siblings()
        			.removeClass("selected");
        	}
        	$(".module-tab-drop").removeClass("module-tab-drop");
        	var dropdownValue = $(this).find("span").data("dropdown-value");
        	$(this).parents(".module-tab-items").siblings(".module-tab-name").children(
        		".module-tab-value.value-down").text(dropdownValue);
        });
        //关闭公告
        $(".close-popup").click(function() {
        	$(".popup").addClass("none");
        });
        
        //播放器提示语
        var swiper2 = new Swiper(".tips-swiper", {
        	direction: 'vertical',
        	speed: 500,
        	loop: true,
        	autoplay: {
        		delay: 3000,
        		disableOnInteraction: false,
        	}
        })
        //关闭播放器提示语    
        $(".close-btn").click(function() {
        	$(".tips-box").hide();
        });
        
        
        // 弹窗公告
        $('.popup-ts').addClass('none').removeClass('open');
        
        if (!ShouTu.Cookie.Get('popupShown')) {
        	$('.popup-ts').removeClass('none').addClass('open');
        }
        
        // 点击关闭按钮时的处理
        $('#close-popup').click(function() {
        	$('.popup-ts').removeClass('open').addClass('none');
        	ShouTu.Cookie.Set('popupShown', 'true', 1);
        });
	},
	'Other': {
		'Toast': function(msg, time) {
			if ($('#shortcuts-info').length === 0) {
				$('body').append('<div class="shortcuts-box"><div id="shortcuts-info"></div></div>');
			}

			var $shortcutsBox = $('.shortcuts-box');
			var $toastContainer = $('#shortcuts-info');

			if ($toastContainer.find('.toast').length) {
				$toastContainer.find('.toast').remove();
			}

			$toastContainer.append('<div class="toast">' + msg + '</div>');
			var $toast = $toastContainer.find('.toast');

			$shortcutsBox.fadeIn(200);
			$toast.fadeIn(200);

			setTimeout(function() {
				$toast.fadeOut(200, function() {
					$toast.remove();
				});
				$shortcutsBox.fadeOut(200);
			}, time);
		},
	},
	'goods': {
		'load': function() {
			if ($('.video-iframe').length) {
				ShouTu.player.load();
			}
			if ($('.get-hits').length) {
				var a = $('.get-hits');
				$.get('/index.php/ajax/hits?mid=' + a.attr('data-mid') + '&id=' + a.attr('data-id') +
					'&type=update');
			}
		},
		'record': function(type, name, part, link, pic, vod, limit) {
			if (!link) {
				link = document.URL;
			}
			var history = ShouTu.Cookie.Get(type);
			var len = 0;
			var canadd = true;
			if (history) {
				history = eval("(" + history + ")");
				len = history.length;
				$(history).each(function() {
					if (name == this.name) {
						canadd = false;
						var json = "[";
						$(history).each(function(i) {
							var temp_name, temp_pic, temp_link, temp_part, temp_vod;
							if (this.name == name) {
								temp_name = name;
								temp_pic = pic;
								temp_link = link;
								temp_part = part;
								temp_vod = vod;
							} else {
								temp_name = this.name;
								temp_pic = this.pic;
								temp_link = this.link;
								temp_part = this.part;
								temp_vod = this.vod;
							}
							json += "{\"name\":\"" + temp_name + "\",\"pic\":\"" + temp_pic +
								"\",\"link\":\"" + temp_link + "\",\"part\":\"" + temp_part +
								"\",\"vod\":\"" + temp_vod + "\"}";
							if (i != len - 1)
								json += ",";
						})
						json += "]";
						ShouTu.Cookie.Set(type, json, 365);
						return false;
					}
				});
			}
			if (canadd) {
				var json = "[";
				var start = 0;
				var isfirst = "]";
				isfirst = !len ? "]" : ",";
				json += "{\"name\":\"" + name + "\",\"pic\":\"" + pic + "\",\"link\":\"" + link +
					"\",\"part\":\"" + part + "\",\"vod\":\"" + vod + "\"}" + isfirst;
				if (len > limit - 1)
					len -= 1;
				for (i = 0; i < len - 1; i++) {
					json += "{\"name\":\"" + history[i].name + "\",\"pic\":\"" + history[i].pic +
						"\",\"link\":\"" + history[i].link + "\",\"part\":\"" + history[i].part +
						"\",\"vod\":\"" + history[i].vod + "\"},";
				}
				if (len > 0) {
					json += "{\"name\":\"" + history[len - 1].name + "\",\"pic\":\"" + history[len - 1].pic +
						"\",\"link\":\"" + history[len - 1].link + "\",\"part\":\"" + history[len - 1].part +
						"\",\"vod\":\"" + history[len - 1].vod + "\"}]";
				}
				ShouTu.Cookie.Set(type, json, 365);
			}
		}
	},
	'player': {
		'load': function() {
			var a = $('.video-iframe');
			ShouTu.goods.record($('body').attr('data-history'), a.attr('data-name'), a.attr('data-title'), a
				.attr('data-link'), a.attr('data-pic'), a.attr('data-detail'), a.attr('data-limit'));
			if (a.attr('data-play').indexOf(".m3u8") != -1) {
				$.getScript("/template/shoutu42/assets/js/artplayer.min.js", function() {
					ShouTu.player.html(a.attr('data-path'), a.attr('data-color'), a.attr('data-play'), a
						.attr('data-pre'), a.attr('data-next'));
				});
			} else {
				$('.video-iframe').append('<iframe " src="' + a.attr('data-jiexi') + a.attr('data-play') +
					'" frameborder="0" scrolling="no" allowtransparency="true"></iframe>');
			}
		},
		'html': function(path, color, play, pre, next) {
			Artplayer.CONTEXTMENU = false;
			var art = new Artplayer({
				container: '.video-iframe',
				url: play,
				poster: 'https://mgtv-bbqn.oss-cn-beijing.aliyuncs.com/1/23062617415210B515DA9EE3435482C90DC0B69CCOEdF/hFhWqx0.jpeg',
				autoplay: true,
				pip: true,
				screenshot: true,
				setting: true,
				flip: true,
				playbackRate: true,
				aspectRatio: true,
				fullscreen: true,
				mutex: true,
				backdrop: true,
				playsInline: true,
				autoPlayback: true,
				fastForward: true,
				playsInline: true,
				theme: '#23ade5',
				settings: [{
					html: '选集设置',
					selector: [{
							html: '上一集',
							url: pre,
						},
						{
							html: '下一集',
							url: next,
						},
					],
					onSelect: function(item) {
						if (item.url) {
							art.notice.show = "即将为您播放" + item.html;
							top.location.href = item.url;
						} else {
							art.notice.show = "对不起，没有" + item.html + "了";
						}
					},
				}, ],
				customType: {
					m3u8: function(video, url) {
						$.getScript("/template/shoutu42/assets/js/hls.min.js",
							function() {
								if (Hls.isSupported()) {
									const hls = new Hls();
									hls.loadSource(url);
									hls.attachMedia(video);
								} else {
									const canPlay = video.canPlayType(
										'application/vnd.apple.mpegurl');
									if (canPlay === 'probably' || canPlay == 'maybe') {
										video.src = url;
									} else {
										art.notice.show = '不支持播放m3u8格式';
									}
								}
							});
					},
				},
			});
			art.on('video:ended', (...args) => {
				if (next) {
					art.notice.show = "即将为您播放下一集";
					top.location.href = next;
				} else {
					art.play();
				}
			});
		},
	},
	'Mac': {
		'History': {
			'BoxShow': 0,
			'Limit': 10,
			'Days': 7,
			'Json': '',
			'Init': function() {
				if ($('.drop-history').length == 0) {
					return;
				}

				var jsondata = [];
				var html = '';
				if (this.Json) {
					jsondata = this.Json;
				} else {
					var jsonstr = ShouTu.Cookie.Get('drop-history');
					if (jsonstr != undefined) {
						jsondata = eval(jsonstr);
					}
				}

				if (jsondata.length > 0) {
					for ($i = 0; $i < jsondata.length; $i++) {
						html += '<li class="list-item"><a href="' + jsondata[$i].link + '" title="' + jsondata[
								$i].name + '" class="list-item-link"><i class="icon-play"></i><span>' +
							jsondata[$i].part + '</span>' + jsondata[$i].name + '</a></li>';
					}
				} else {
					html = '<li class="drop-tips">暂无观影历史</li>';
				}

				$("#history").append(html);

				if ($(".mac_history_set").attr('data-name')) {
					var $that = $(".mac_history_set");
					ShouTu.Mac.History.Set($that.attr('data-name'), $that.attr('data-link'), $that.attr(
						'data-part'));
				}
			},
			'Set': function(name, link, part) {
				if (!link) {
					link = document.URL;
				}
				var jsondata = ShouTu.Cookie.Get('drop-history');
				if (jsondata != undefined) {
					this.Json = eval(jsondata);

					for ($i = 0; $i < this.Json.length; $i++) {
						if (this.Json[$i].link == link) {
							return false;
						}
					}
					jsonstr = '{log:[{"name":"' + name + '","link":"' + link + '","part":"' + part + '"},';
					for ($i = 0; $i < this.Json.length; $i++) {
						if ($i <= this.Limit && this.Json[$i]) {
							let ecRepeat = this.Json[$i].name;
							if (ecRepeat === name) {} else {
								jsonstr += '{"name":"' + this.Json[$i].name + '","link":"' + this.Json[$i]
									.link + '","part":"' + this.Json[$i].part + '"},';
							}
						} else {
							break;
						}
					}
					jsonstr = jsonstr.substring(0, jsonstr.lastIndexOf(','));
					jsonstr += "]}";
				} else {
					jsonstr = '{log:[{"name":"' + name + '","link":"' + link + '","part":"' + part + '"}]}';
				}
				this.Json = eval(jsonstr);
				ShouTu.Cookie.Set('drop-history', jsonstr, this.Days);
			},
			'Clear': function() {
				$('.playlist.historyclean').on('click', function(event) {
					event.preventDefault();
					ShouTu.Cookie.Del('drop-history');
					ShouTu.Other.Toast('观看历史已清空', 1000);
					setTimeout(function() {
						location.reload();
					}, 1200);
				});
			}
		},
		'Gbook': {
			'Init': function() {
				$('body').on('keyup', '.report-content', function(e) {
					ShouTu.Mac.Remaining($(this), 200, '.gbook_remaining')
				});
				$('body').on('click', '.gbook_submit', function(e) {
					ShouTu.Mac.Gbook.Submit();
				});
			},
			'Submit': function() {
				if ($(".report-content").val() == '') {
					ShouTu.Other.Toast('内容不能为空', 1500);
					return false;
				}
				ShouTu.Ajax(maccms.path + '/index.php/gbook/saveData', 'post', 'json', $('.gbook_form')
					.serialize(),
					function(r) {
						if (r.code == 1) {
							ShouTu.Other.Toast('留言成功', 1000);
							setTimeout(function() {
								location.reload();
							}, 1000);
						} else {
							if (ShouTu.Mac.Gbook.Verify == 1) {
								ShouTu.Mac.Verify.Refresh();
							}
							ShouTu.Other.Toast(r.msg,1000);
						}
					});
			},
			'Report': function(name, id) {
				ShouTu.Mac.Pop.Show('我要报错', maccms.path + '/index.php/gbook/report.html?id=' + id + '&name=' +
					encodeURIComponent(name),
					function(r) {});
			}
		},
		'Pop': {
			'Remove': function() {
				$('.shortcuts-overlay').remove();
				$('.popup').remove();
			},
			'RemoveMsg': function() {
				$('.popup-msg').remove();
			},
			'Msg': function($msg, $timeout) {
				if ($('.shortcuts-overlay').length != 1) {
					ShouTu.Mac.Pop.Remove();
				}
				$('body').append('<div class="popup-msg"></div>');
				$('.popup-msg').html($msg);
				$('.popup-msg').show();
				setTimeout(ShouTu.Mac.Pop.RemoveMsg, $timeout);
			},
			'Show': function($title, $url, $callback) {
				if ($('.shortcuts-mobile-overlay').length != 1) {
					ShouTu.Mac.Pop.Remove();
				}
				$('body').append(
					'<div class="popup" id="report-popup"><div class="popup-icon"><img src="/template/shoutu42/assets/images/report.svg"></div><div class="popup-header"><h2 class="popup-title"></h2></div><div class="popup-main"></div><div class="close-popup" id="close-popup"><i class="icon-close-o"></i></div></div><div class="shortcuts-overlay"></div>'
				);
				$('.close-popup').click(function() {
					$('.shortcuts-overlay,.popup').remove();
				});
				$('.popup-main').html('');
				$('.popup-header').find('h2').html($title);
				ShouTu.Ajax($url, 'post', 'json', '', function(r) {
					$(".popup-main").html(r);
					$callback(r);
				}, function() {
					$(".popup-main").html('加载失败，请刷新...');
				});
				$('.shortcuts-overlay,.popup').show();
			}
		},

		'Verify': {
			'Init': function() {
				ShouTu.Mac.Verify.Focus();
				ShouTu.Mac.Verify.Click();
			},
			'Focus': function() { //验证码框焦点
				$('body').on("focus", ".mac_verify", function() {
					$(this).removeClass('mac_verify').after(ShouTu.Mac.Verify.Show());
					$(this).unbind();
				});
			},
			'Click': function() { //点击刷新
				$('body').on('click', 'img.mac_verify_img', function() {
					$(this).attr('src', maccms.path + '/index.php/verify/index.html?r=' + Math
						.random());
				});
			},
			'Refresh': function() {
				$('.mac_verify_img').attr('src', maccms.path + '/index.php/verify/index.html?r=' + Math
					.random());
			},
			'Show': function() {
				return '<img class="mac_verify_img" src="' + maccms.path +
					'/index.php/verify/index.html?"  title="看不清楚? 换一张！">';
			}
		},
		'PageGo': {
			'Init': function() {
				$('.mac_page_go').click(function() {
					let that = $(this);
					let url = that.attr('data-url');
					let total = parseInt(that.attr('data-total'));
					let sp = that.attr('data-sp');
					let page = parseInt($('#page').val());

					if (page > 0 && (page <= total)) {
						url = url.replace(sp + 'PAGELINK', sp + page).replace('PAGELINK', page);
						location.href = url;
					}
					return false;
				});
			}
		},
		'Hits': {
			'Init': function() {
				if ($('.mac_hits').length == 0) {
					return;
				}
				let $that = $(".mac_hits");
				ShouTu.Ajax(maccms.path + '/index.php/ajax/hits?mid=' + $that.attr("data-mid") + '&id=' + $that
					.attr("data-id") + '&type=update', 'get', 'json', '',
					function(r) {
						if (r.code == 1) {
							$(".mac_hits").each(function(i) {
								$type = $(".mac_hits").eq(i).attr('data-type');
								if ($type != 'insert') {
									$('.' + $type).html(eval('(r.data.' + $type + ')'));
								}
							});
						}
					});

			}
		},
		'Favorite': function() {
			if ($('.favorite').length > 0) {
				$('body').on('click', 'a.favorite', function(e) {
					let $that = $(this);
					if ($that.attr("data-id")) {
						$.ajax({
							url: maccms.path + '/index.php/user/ajax_ulog/?ac=set&mid=' + $that
								.attr("data-mid") + '&id=' + $that.attr("data-id") + '&type=' +
								$that.attr("data-type"),
							cache: false,
							dataType: 'json',
							success: function($r) {
								ShouTu.Other.Toast(r.msg, 1000);
							}
						});
					}
				});
			}
		},
		'Ulog': {
			'Init': function() {
				ShouTu.Mac.Ulog.Set();
				ShouTu.Mac.Ulog.Click();

			},
			'Get': function(mid, id, type, page, limit, call) {
				ShouTu.Ajax(maccms.path + '/index.php/user/ajax_ulog/?ac=list&mid=' + mid + '&id=' + id +
					'&type=' + type + '&page=' + page + '&limit=' + limit, 'get', 'json', '', call);
			},
			'Set': function() {
				if ($(".mac_ulog_set").attr('data-mid')) {
					let $that = $(".mac_ulog_set");
					$.get(maccms.path + '/index.php/user/ajax_ulog/?ac=set&mid=' + $that.attr("data-mid") +
						'&id=' + $that.attr("data-id") + '&sid=' + $that.attr("data-sid") + '&nid=' + $that
						.attr("data-nid") + '&type=' + $that.attr("data-type"));
				}
			},
			'Click': function() {
				$('body').on('click', 'a.mac_ulog', function(e) {
					//是否需要验证登录
					if (ShouTu.Mac.User.IsLogin == 0) {
						ShouTu.Mac.User.Login();
						return;
					}
					let $that = $(this);
					if ($that.attr("data-id")) {
						ShouTu.Ajax(maccms.path + '/index.php/user/ajax_ulog/?ac=set&mid=' + $that.attr(
								"data-mid") + '&id=' + $that.attr("data-id") + '&type=' + $that
							.attr("data-type"), 'get', 'json', '',
							function(r) {
								if (r.code == 1) {
									$that.addClass('disabled');
								} else {
									ShouTu.Other.Toast(r.msg, 1000);
								}
							});
					}
				});
			}
		},
		'Remaining': function(obj, len, show) {
			let count = len - $(obj).val().length;
			if (count < 0) {
				count = 0;
				$(obj).val($(obj).val().substr(0, 200));
			}
			$(show).text(count);
		},
		'Timming': function() {
			if ($('.mac_timming').length == 0) {
				return;
			}
			var infile = $('.mac_timming').attr("data-file");
			if (infile == undefined || infile == '') {
				infile = 'api.php';
			}
			var t = (new Image());
			t.src = maccms.path + '/' + infile + '/timming/index?t=' + Math.random();
		},
	}

};
$(function() {
	ShouTu.Search.Init();
	ShouTu.Qrcode.Init();
	ShouTu.Copy.Init();
	ShouTu.jscode();
	ShouTu.Mac.History.Init();
	ShouTu.Mac.History.Clear();
	ShouTu.Mac.Gbook.Init();
	ShouTu.Mac.Favorite();
	ShouTu.Mac.Hits.Init();
	ShouTu.Mac.Timming();
	ShouTu.goods.load();
});