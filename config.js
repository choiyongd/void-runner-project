// Void Runner — Supabase 연결 설정
// SUPABASE_ANON_KEY는 publishable(anon) 키로, 브라우저에 노출되어도 안전하도록
// 설계된 공개 키입니다 (RLS 정책이 실제 접근 권한을 통제합니다).
// 절대로 service_role 키를 이 파일에 넣지 마세요.
window.VOID_RUNNER_CONFIG = {
  SUPABASE_URL: 'https://bojbghdfdwkvseqyandf.supabase.co',
  SUPABASE_ANON_KEY: 'sb_publishable_HN1ovY2VZcsQgdTaGQ8Hag_DDJpNl0C'
};
