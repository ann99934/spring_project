package com.tam.model;

import lombok.Data;

@Data

public class MemberVO {
	private String id; // ȸ�� ���̵�

	private String pw; // ȸ�� ��й�ȣ

	private String name; // ȸ�� �̸�

	private String email; // ȸ�� �̸���

	private String post; // ȸ�� �����ȣ

	private String addr1; // ȸ�� �ּ�

	private String addr2; // ȸ�� �� �ּ�

	private String tel; // ȸ�� ��ȭ��ȣ

	private int adminCk; // ������ ���� (0: �Ϲ� �����, 1:������)
}
