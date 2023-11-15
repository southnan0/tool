import CryptoJS from 'crypto-js'
import axios from 'axios'

const appid = '20221028001422785'
const key = 'GlwjXOe7aeQj8RR6uZyU'

export default async(query, from = 'zh', to = 'en') => {
    const salt = (new Date()).getTime()
    const str1 = appid + query + salt + key
    const sign = CryptoJS.MD5(str1)
  
    let arr = []
    const params = {
      q: encodeURIComponent(query),
      appid: appid,
      salt: salt,
      from: from,
      to: to,
      sign: sign
    }
    Object.keys(params).forEach(key => {
      arr.push(`${key}=${params[key]}`)
    })
  
    const res = await axios.get(`http://api.fanyi.baidu.com/api/trans/vip/translate?${arr.join('&')}`)
  
    if (res.data.trans_result?.length) {
      return res.data.trans_result[0]?.dst
    }
    if(res.data?.error_code === '54003'){
      console.info(res.data)
    }
    return query
  }